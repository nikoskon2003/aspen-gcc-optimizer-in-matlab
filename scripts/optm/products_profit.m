function prof = products_profit(db)
P_CO2 = 3.009; % $/kmol
P_Benz = 63.93; %73.49;
P_TPA = 137.42; %189.388;
P_Xylenes = 82.68; %106; 
P_Ethylene = 26.91; %30.57;

C_H2 = 6.5472; %3.000;
C_Tol = 74.43; %74.595;
C_AcAc = 32.76; %24.717;
C_MEA = 69.88; %69.631;

ty = 8000;

%%%

p_co2 = P_CO2 * db.Aspen.GetTreeNodeValue(["/Data/Streams/CO2/Output/MOLEFLOW/MIXED/CO2"]);
p_benz = P_Benz * db.Aspen.GetTreeNodeValue(["/Data/Streams/BENZENE/Output/MOLEFLOW/MIXED/BENZENE"]);
p_tpa = P_TPA * db.Aspen.GetTreeNodeValue(["/Data/Streams/TPA-PURE/Output/MOLEFLOW/CIPSD/TEREP(S)"]);
p_xylenes = P_Xylenes * db.Aspen.GetTreeNodeValue(["/Data/Streams/XYLENES/Output/MOLEFLMX/MIXED"]);
p_ethylene = P_Ethylene * db.Aspen.GetTreeNodeValue(["/Data/Streams/ETH/Output/MOLEFLOW/MIXED/ETHYLENE"]);

c_h2_1 = C_H2 * db.Aspen.GetTreeNodeValue(["/Data/Streams/H2/Output/MOLEFLOW/MIXED/HYDROGEN"]);
c_h2_2 = C_H2 * db.Aspen.GetTreeNodeValue(["/Data/Streams/H2-AMOCO/Output/MOLEFLOW/MIXED/HYDROGEN"]);
c_tol = C_Tol * db.Aspen.GetTreeNodeValue(["/Data/Streams/TOL/Output/MOLEFLOW/MIXED/TOLUENE"]);
c_acac = C_AcAc * db.Aspen.GetTreeNodeValue(["/Data/Streams/HAC-NEW/Output/MOLEFLOW/MIXED/HOAC"]);
c_mea = C_MEA * db.Aspen.GetTreeNodeValue(["/Data/Streams/MEA/Output/MOLEFLOW/MIXED/MONOE-01"]);


%disp([p_co2 p_benz p_tpa c_h2_1 c_h2_2 c_tol c_acac c_mea])

prof = ty * (p_co2+p_benz+p_tpa + p_xylenes + p_ethylene - c_h2_1-c_h2_2-c_tol-c_acac-c_mea);
end