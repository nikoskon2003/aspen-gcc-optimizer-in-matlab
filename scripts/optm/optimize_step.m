function [tac1, tn] = optimize_step(db)
global conf;
fprintf("- Init");
db.Aspen.Aspen.Reinit();
db.Aspen.TryRun(conf.ignore_run_errors);

opt_vars = struct("Type", {}, "Name", {}, "VarDat", {}, "Value", {}, "TAC_d", {});
tac1 = total_tac(db);

fprintf(" / Populate\n");

for b = db.GetAllBlocks()
    vardat = choose_vars(b);
    if isempty(vardat)
        continue
    end

    for vd = vardat
        opt_vars(end+1).Type = 'Block';
        opt_vars(end).Name = b.Name;
        opt_vars(end).VarDat = vd;
        opt_vars(end).Value = db.Aspen.GetTreeNodeValue(["/Data/Blocks/", b.Name, "/Input/", vd.Name]);
        opt_vars(end).TAC_d = 0;
    end
end


% Spec 1
opt_vars(end+1).Type = 'Spec';
opt_vars(end).Name = 'PFR-MEOH';
opt_vars(end).VarDat = struct("Name", "EXPR2", "min", 0.01, "max", 1000, "w", 5, "Linked", []);
opt_vars(end).Value = str2double(db.Aspen.GetTreeNodeValue(["/Data/Flowsheeting Options/Design-Spec/",opt_vars(end).Name,"/Input/EXPR2"]));
opt_vars(end).TAC_d = 0;


% Spec 2
opt_vars(end+1).Type = 'Spec';
opt_vars(end).Name = 'H2-FEED';
opt_vars(end).VarDat = struct("Name", "EXPR2", "min", 3, "max", 20, "w", 0.01, "Linked", []);
opt_vars(end).Value = str2double(db.Aspen.GetTreeNodeValue(["/Data/Flowsheeting Options/Design-Spec/",opt_vars(end).Name,"/Input/EXPR2"]));
opt_vars(end).TAC_d = 0;


%{
% Spec 3
opt_vars(end+1).Type = 'Spec';
opt_vars(end).Name = 'PFR-PX';
opt_vars(end).VarDat = struct("Name", "EXPR2", "min", 0.0005, "max", 100, "w", 0.000001, "Linked", []);
opt_vars(end).Value = str2double(db.Aspen.GetTreeNodeValue(["/Data/Flowsheeting Options/Design-Spec/",opt_vars(end).Name,"/Input/EXPR2"]));
opt_vars(end).TAC_d = 0;

% Spec 4
opt_vars(end+1).Type = 'Spec';
opt_vars(end).Name = 'TOL-FEED';
opt_vars(end).VarDat = struct("Name", "EXPR2", "min", 6, "max", 23, "w", 1, "Linked", []);
opt_vars(end).Value = str2double(db.Aspen.GetTreeNodeValue(["/Data/Flowsheeting Options/Design-Spec/",opt_vars(end).Name,"/Input/EXPR2"]));
opt_vars(end).TAC_d = 0;
%}

eps = 1e-3;

for vi = 1:length(opt_vars)
    fprintf(" %d) %s ", vi, opt_vars(vi).Name);
    vv = opt_vars(vi).Value;
    vv_e = vv * (1 + eps);

    clear n;
    if (opt_vars(vi).Type == "Block")
        n(1) = db.Aspen.GetTreeNode(["/Data/Blocks/", opt_vars(vi).Name, "/Input/", opt_vars(vi).VarDat.Name]);
    else
        n(1) = db.Aspen.GetTreeNode(["/Data/Flowsheeting Options/Design-Spec/", opt_vars(vi).Name, "/Input/EXPR2"]);
    end

    if ~isempty(opt_vars(vi).VarDat.Linked)
        for l = opt_vars(vi).VarDat.Linked
            n(end+1) = db.Aspen.GetTreeNode(["/Data/Blocks/", l.Block, "/Input/", l.Prop]);
        end
    end

    for ni = 1:length(n)
        try
            n(ni).Value = vv_e;
        catch e
        end
    end


    db.Aspen.TryRun(conf.ignore_run_errors);
    tac2 = total_tac(db);

    for ni = length(n):-1:1
        try
            n(ni).Value = vv;
        catch e
        end
    end


    opt_vars(vi).TAC_d = (tac2-tac1)/(vv_e - vv);

    fprintf(" | d = %.3e\n", opt_vars(vi).TAC_d);
end

fprintf("- Setting new vars:\n");
alpha = 1e-7;
for vi = 1:length(opt_vars)
    fprintf(" %d) %s ", vi, opt_vars(vi).Name);
    clear n;
    if (opt_vars(vi).Type == "Block")
        n(1) = db.Aspen.GetTreeNode(["/Data/Blocks/", opt_vars(vi).Name, "/Input/", opt_vars(vi).VarDat.Name]);
    else
        n(1) = db.Aspen.GetTreeNode(["/Data/Flowsheeting Options/Design-Spec/", opt_vars(vi).Name, "/Input/EXPR2"]);
    end

    if ~isempty(opt_vars(vi).VarDat.Linked)
        for l = opt_vars(vi).VarDat.Linked
            n(end+1) = db.Aspen.GetTreeNode(["/Data/Blocks/", l.Block, "/Input/", l.Prop]);
        end
    end

    val = min(max(opt_vars(vi).Value - alpha*opt_vars(vi).VarDat.w*opt_vars(vi).TAC_d, opt_vars(vi).VarDat.min), opt_vars(vi).VarDat.max);

    dv = val - opt_vars(vi).Value;

    idxs = 1:length(n);
    if dv < 0
        idxs = flip(idxs);
    end

    for ni = idxs
        try
            n(ni).Value = val;
        catch e
        end
    end

    fprintf(" | v = %.7f\n", val);
end

fprintf("- New TAC calc: \n")

db.Aspen.Aspen.Reinit();
db.Aspen.TryRun(conf.ignore_run_errors);

tn = total_tac(db);
fprintf(" ΔTAC: %.1f -> %.1f | %.1f\n", tac1, tn, tn-tac1);
end

function n = choose_vars(block)
n = struct("Name", {}, "min", {}, "max", {}, "w", {}, "Linked", struct("Block", {}, "Prop", {}));

switch block.Name
    
    case "COMP-2"
        n(1).Name = "PRES";
        n(1).min = 50;
        n(1).max = 100;
        n(1).w = 1000;

        n(1).Linked(1).Block = 'COMP-1';
        n(1).Linked(1).Prop = 'PRES';

    case "H-MEOH"
        n(1).Name = "PRES";
        n(1).min = 0.5;
        n(1).max = 3.1;
        n(1).w = 100;

        n(1).Linked(1).Block = 'DIST-M';
        n(1).Linked(1).Prop = 'PBOT';
        n(1).Linked(2).Block = 'DIST-M';
        n(1).Linked(2).Prop = 'PTOP';
    case "DIST-M"
        n(1).Name = "RR";
        n(1).min = -10;
        n(1).max = -1.01;
        n(1).w = 0.1;
    
    case "!COMP-3"
        n(1).Name = "PRES";
        n(1).min = 5;
        n(1).max = 10;
        n(1).w = 1;

        n(1).Linked(1).Block = 'PUMP-1';
        n(1).Linked(1).Prop = 'PRES';
        n(1).Linked(2).Block = 'PUMP-2';
        n(1).Linked(2).Prop = 'PRES';
    case "!H-102"
        n(1).Name = "TEMP";
        n(1).min = 350;
        n(1).max = 550;
        n(1).w = 1;
    case "!C-101"
        n(1).Name = "TEMP";
        n(1).min = 30;
        n(1).max = 100;
        n(1).w = 1;

    case "!HEATER-B"
        n(1).Name = "PRES";
        n(1).min = 0.5;
        n(1).max = 10;
        n(1).w = 1;

        n(1).Linked(1).Block = 'DIST-B';
        n(1).Linked(1).Prop = 'PBOT';
        n(1).Linked(2).Block = 'DIST-B';
        n(1).Linked(2).Prop = 'PTOP';

    case "!HEAT-PX"
        n(1).Name = "PRES";
        n(1).min = 0.5;
        n(1).max = 10;
        n(1).w = 1;

        n(1).Linked(1).Block = 'DIST-PX';
        n(1).Linked(1).Prop = 'PBOT';
        n(1).Linked(2).Block = 'DIST-PX';
        n(1).Linked(2).Prop = 'PTOP';

    case "!DIST-B"
        n(1).Name = "RR";
        n(1).min = -10;
        n(1).max = -1.01;
        n(1).w = 0.1;
    case "!DIST-PX"
        n(1).Name = "RR";
        n(1).min = -10;
        n(1).max = -1.01;
        n(1).w = 0.1;

     case "!C-FLASH2"
        n(1).Name = "PRES";
        n(1).min = 0.5;
        n(1).max = 3;
        n(1).w = 1;

        n(2).Name = "TEMP";
        n(2).min = 25;
        n(2).max = 50;
        n(2).w = 1;
end
end