function res = opt_fun(X)
global db
global conf

%n{1} = ["/Data/Flowsheeting Options/Design-Spec/PFR-MEOH/Input/EXPR2"];
%n{2} = ["/Data/Flowsheeting Options/Design-Spec/H2-FEED/Input/EXPR2"];
%n{3} = ["/Data/Blocks/COMP-1/Input/PRES", "/Data/Blocks/COMP-2/Input/PRES"];
%n{4} = ["/Data/Blocks/H-MEOH/Input/PRES", "/Data/Blocks/DIST-M/Input/PBOT", "/Data/Blocks/DIST-M/Input/PTOP"];
%n{5} = ["/Data/Blocks/DIST-M/Input/RR"];


%n{1} = ["/Data/Blocks/COMP-3/Input/PRES", "/Data/Blocks/PUMP-1/Input/PRES", "/Data/Blocks/PUMP-2/Input/PRES"];
%n{2} = ["/Data/Blocks/HEATER-B/Input/PRES", "/Data/Blocks/DIST-B/Input/PBOT", "/Data/Blocks/DIST-B/Input/PTOP"];
%n{3} = ["/Data/Blocks/HEATER-PX/Input/PRES", "/Data/Blocks/DIST-PX/Input/PBOT", "/Data/Blocks/DIST-PX/Input/PTOP"];
%n{4} = ["/Data/Blocks/DIST-B/Input/RR"];
%n{5} = ["/Data/Blocks/DIST-PX/Input/RR"];
%n{3} = ["/Data/Blocks/C-FLASH2/Input/PRES"];
%n{4} = ["/Data/Flowsheeting Options/Design-Spec/PFR-PX/Input/EXPR2"];
%n{5} = ["/Data/Flowsheeting Options/Design-Spec/TOL-FEED/Input/EXPR2"];
%n{6} = ["/Data/Blocks/H-102/Input/TEMP"];
%n{6} = ["/Data/Blocks/COMP-ETH/Input/PRES"];

%n{1} = ["/Data/Blocks/COMP-4/Input/PRES"];
%n{2} = ["/Data/Blocks/H-103/Input/TEMP"];
%n{1} = ["/Data/Blocks/R-103/Input/RES_TIME"];
%n{2} = ["/Data/Flowsheeting Options/Design-Spec/AIR-FEED/Input/EXPR2"];
%n{3} = ["/Data/Flowsheeting Options/Design-Spec/HAC-FEED/Input/EXPR2"];

n{1} = ["/Data/Blocks/COMP-5/Input/PRES"];
n{2} = ["/Data/Blocks/H-105/Input/TEMP"];


for i = 1:length(X)
    for j = 1:3
        for nn = n{i}
            node = db.Aspen.GetTreeNode([nn]);
            try
                node.Value = X(i);
            catch e
            end
        end
    end
end

db.Aspen.TryRun(conf.ignore_run_errors);
res = total_tac(db);
end