function TAC = FLASH(db, blk)

block_id = blk.Name;
%% Συντελεστές

e=0.25; % Επιβάρυνση της επένδυσης στο ετήσιο κόστος λειτουργίας

Co_flash = 75000; % $
Fo_flash = 1000; % kmol/hr
Po_flash = 1; % bar
k_flash = 0.4;
exp_F_flash = 0.6; % Εκθέτης στο F/Fo
exp_P_flash = 0.25; % Εκθέτης στο P/Po

%% Υπολογισμός

P = db.Aspen.GetTreeNodeValue(["/Data/Blocks/", block_id, "/Output/B_PRES"]); % Πίεση Flash
VF = db.Aspen.GetTreeNodeValue(["/Data/Blocks/", block_id, "/Output/B_VFRAC"]); % Κλάσμα V/F 
F = db.Aspen.GetTreeNodeValue(["/Data/Streams/", blk.Ports(1).Streams, "/Output/TOT_FLOW"]); % Mole flow ρεύματος τροφοδοσίας flash 

OPEX_i=0;
CAPPEX_i = Co_flash*(F/Fo_flash)^exp_F_flash*(P/Po_flash)^exp_P_flash*(1 + k_flash*VF); 

TAC = OPEX_i + e*CAPPEX_i; 
end




