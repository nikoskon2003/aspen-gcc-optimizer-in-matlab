function TAC = HEATER(db, blk)

block_id = blk.Name;

OP_hr = 8000; % Ετήσιος χρόνος λειτουργίας σε ώρες
e = 0.25; % Επιβάρυνση της επένδυσης στο ετήσιο κόστος λειτουργίας

Co_ex = 32800; % $
Ao_ex = 80; % m^2
exp_ex = 0.68; % Εκθέτης στο A/Ao
U = 1; % kW/m^2/K

%% Υπολογισμός κόστους
UT_ID = db.Aspen.GetTreeNodeValue(["/Data/Blocks/", block_id, "/Output/UTL_ID"]);

T_UT_OUT = db.Aspen.GetTreeNodeValue(["/Data/Utilities/", UT_ID, "/Output/UTL_OUT_TEMP"]);
T_UT_IN = db.Aspen.GetTreeNodeValue(["/Data/Utilities/", UT_ID, "/Output/UTL_IN_TEMP"]); % T εισόδου Utility

T_OUT = db.Aspen.GetTreeNodeValue(["/Data/Blocks/", block_id, "/Input/TEMP"]); % Τ εξόδου ρεύματος διεργασίας
T_IN = db.Aspen.GetTreeNodeValue(["/Data/Streams/", blk.Ports(1).Streams, "/Output/RES_TEMP"]); % Τ εισόδου ρεύματος διεργασίας

Q = abs(db.Aspen.GetTreeNodeValue(["/Data/Blocks/", block_id, "/Output/QCALC"])); % Θερμικό φορτίο εναλλάκτη

DT1 = abs(T_IN - T_UT_OUT);
DT2 = abs(T_OUT - T_UT_IN);
DT = (DT2 - DT1)/log(DT2/DT1);
A = Q/(U*DT); % Εμβαδό εναλλάκτη - m^2

CAPPEX_i = Co_ex*(A/Ao_ex)^exp_ex;

OPEX_i_yr = db.Aspen.GetTreeNodeValue(["/Data/Utilities/", UT_ID, "/Output/UTL_COST/", block_id])*OP_hr;

TAC = 0*OPEX_i_yr + 0*e*CAPPEX_i; % $/yr
end