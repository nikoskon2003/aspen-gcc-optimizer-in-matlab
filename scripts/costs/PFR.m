function TAC = PFR(db, blk)

block_id = blk.Name;
%% Συντελεστές

OP_yr=8000; % Ετήσιος χρόνος λειτουργίας σε hr
e=0.25; % Επιβάρυνση της επένδυσης στο ετήσιο κόστος λειτουργίας
c_cw=0.01; % $/kWh
c_steam=0.03; % $/kWh

Co=11500;
Vo=1; % m^3
n=0.45;

%% Υπολογισμός

res_time = db.Aspen.GetTreeNodeValue(["/Data/Blocks/", block_id, "/Output/RES_TIME"]);
Vol_flow = db.Aspen.GetTreeNodeValue(["/Data/Streams/", blk.Ports(1).Streams, "/Output/STDVFLOW"]);

Q = db.Aspen.GetTreeNodeValue(["/Data/Blocks/", block_id,"/Output/QCALC"]);

V = Vol_flow*res_time; % m^3

if Q<=0
    OPEX_i = abs(Q*OP_yr*c_cw);
else
    OPEX_i = Q*OP_yr*c_steam;
end

CAPPEX_i = Co*(V/Vo)^n;

TAC = OPEX_i + e*CAPPEX_i;
end