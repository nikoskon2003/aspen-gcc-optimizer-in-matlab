function TAC = COMPRESSOR(db, blk)

block_id = blk.Name;

%% Συντελεστές
e = 0.25; % Επιβάρυνση της επένδυσης στο ετήσιο κόστος λειτουργίας
c_el = 0.1; % $/kWh
OP_yr = 8000; % Ετήσιος χρόνος λειτουργίας σε hr
Co = 98400;
Wo = 250;
n = 0.46;

%% Υπολογισμοί

W_is = db.Aspen.GetTreeNodeValue(["/Data/Blocks/", block_id,"/Output/POWER_ISEN"]); % Έργο - ισεντροπικό (kW)
n_is = db.Aspen.GetTreeNodeValue(["/Data/Blocks/", block_id, "/Output/EFF_ISEN"]); % ισεντροπικός βαθμός απόδοσης

W = W_is/n_is; % Πραγματικό έργο (kW)

OPEX_i = W*OP_yr*c_el; % Ετήσιο λειτουργικό κόστος
CAPPEX_i = Co*abs(W/Wo)^n; % Πάγιο κόστος εξοπλισμού

TAC = OPEX_i + e*CAPPEX_i;
end
