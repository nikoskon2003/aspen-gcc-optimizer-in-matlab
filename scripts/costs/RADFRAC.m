function TAC = RADFRAC(db, blk)

block_id = blk.Name;
%% Συντελεστές

e=0.25; % Επιβάρυνση της επένδυσης στο ετήσιο κόστος λειτουργίας
c_cw=0.01; % $/kWh
c_steam=0.03; % $/kWh
OP_yr=8000; % Ετήσιος χρόνος λειτουργίας σε hr

Co_col = 1000000; % $
No = 20; % Βαθμίδες
Po = 10; % bar
Fo = 5000; % kmol/hr
Co_reb = 100000; % $
Co_cond = 80000; % $
Qo = 1000; % kW
exp_N = 0.5; % Εκθέτης στο Ν/Νο
exp_P = 0.2; % Εκθέτης στο P/Pο
exp_F = 0.6; % Εκθέτης στο F/Fo
exp_Q = 0.7; % Εκθέτης στο Q/Qo

%% Υπολογισμοί

N = double(db.Aspen.GetTreeNodeValue(["/Data/Blocks/", block_id,"/Input/NSTAGE"]));
P = double(db.Aspen.GetTreeNodeValue(["/Data/Blocks/", block_id, "/Input/PRES1"]));
F = double(db.Aspen.GetTreeNodeValue(["/Data/Streams/", blk.Ports(1).Streams(1),"/Output/RES_MOLEFLOW"]));

Q_cond = double(db.Aspen.GetTreeNodeValue(["/Data/Blocks/", block_id,"/Output/COND_DUTY"]));
Q_reb = double(db.Aspen.GetTreeNodeValue(["/Data/Blocks/", block_id,"/Output/REB_DUTY"]));

C_col = Co_col*(N/No)^exp_N*(P/Po)^exp_P*(F/Fo)^exp_F; % Κόστος στήλης
C_reb = Co_reb*(Q_reb/Qo)^exp_Q;  % κόστος αναβραστήρα
C_cond = Co_cond*abs(Q_cond/Qo)^exp_Q; % κόστος συμπυκνωτήρα

CAPPEX_i = C_col + C_reb + C_cond;
OPEX_i = Q_reb*c_steam*OP_yr + abs(Q_cond)*c_cw*OP_yr;

TAC = OPEX_i + e*CAPPEX_i;
end