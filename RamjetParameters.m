function [P_inf,T_inf,M_inf,Shockstrength,M_burner,T_burner,T_req,gamma,R,Cp] = RamjetParameters()

% Setting default parameters for each value, as found in [1]:
P_inf = 70e3; %free stream pressure, Pa
T_inf = 210; %free stream temperature, K
M_inf = 2.8; %flight mach number
Shockstrength = 1.1; %normal shock strength
M_burner = 0.2; %burner entry mach number
T_burner = 1700; %burner temperature, K
T_req = 10e3; %required thrust, N
gamma = 1.4;
R = 287;
Cp = 1005;

end
