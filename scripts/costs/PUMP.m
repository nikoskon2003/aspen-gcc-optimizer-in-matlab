function TAC = PUMP(db, blk)

block_id = blk.Name;
%% Συντελεστές

e=0.25; % Επιβάρυνση της επένδυσης στο ετήσιο κόστος λειτουργίας
c_el = 0.1; % $/kWh
OP_yr=8000; % Ετήσιος χρόνος λειτουργίας σε hr

Co=9840;
Wo=4;
n=0.55;


%% Υπολογισμοί

W = db.Aspen.GetTreeNodeValue(["/Data/Blocks/", block_id, "/Output/BRAKE_POWER"]); % Έργo (kW)

OPEX_i = W*OP_yr*c_el; % Ετήσιο λειτουργικό κόστος
CAPPEX_i = Co*abs(W/Wo)^n; % Πάγιο κόστος εξοπλισμού

TAC = OPEX_i + e*CAPPEX_i;
end