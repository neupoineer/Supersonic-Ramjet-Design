function [eta_p,eta_cycle,eta_total] = Ramjet(P1,T1,M_inf,Shockstrength,M_burner,T_burner,T_req,gamma,R,Cp)

%% Inlet Calculations
% Calculate properties between the inlet and the throat using the
% isentroppic flow relations:
[T0xT1,P0xP1,A1Ac1] = Isentropic(M_inf);

% Calculate properties across the normal shock downstream of the throat.
[T0xTx,P0xPx,AxAc1] = Isentropic(Shockstrength); 
[My,PyPx] = ShockRelations(Shockstrength);
[T0yTy,P0yPy,AyAc2] = Isentropic(My); 

% Inlet to shock area ratio:
A1Ax = A1Ac1 / AxAc1; 

%% Now, consider the constant-area burner.
[T0yT2,P0yP2,A2Ac2] = Isentropic(M_burner);
A2A1 = (A2Ac2 / AyAc2) / A1Ax ; %Ax=Ay, A2=Ab
T2 = (T0xT1 / T0yT2) * T1; 
P2P1 = P0xP1 / P0yP2 * P0yPy * PyPx / P0xPx; %Pressure constant throughout burner
M_burner_out = M_burner * sqrt(T_burner / T2);

% Second throat properties.
[T0bTb,P0bPb,AbAc2] = Isentropic(M_burner_out);
Ac2A1 = A2A1/AbAc2;

%% Exhaust outlet conditions. 
% Assume ideal expansion (P4=P1).
P4P0b = 1/(P2P1*P0bPb);
M4 = sqrt((P4P0b^((1-gamma)/gamma)-1)*(2/(gamma-1)));
[T0bT4,P0bP4,A4Ac2] = Isentropic(M4);
A4A1 = A4Ac2 * Ac2A1;

%% Output Required Engine Areas
A1 = T_req/(P1*gamma*M_inf^2*(M4^2/M_inf^2*A4A1-1)); %Inlet area

%% Output Required Temperatures
T4 = T0bTb/T0bT4 * T_burner;

%% Efficiencies 
% Define fuel properties required for thermodynamic efficiency. Assuming
% the use of octane and taking values from the lecture notes:
Fuel_to_air_ratio = 0.06641; %stoichiometric ratio for efficient burning
e = 44786000; %heating value of fuel (J/kg) 

eta_p = T_req/(P1*A1)*2/gamma*(1/(T4/T1*M4^2-M_inf^2));
eta_cycle = 1-((T4/T_burner)*((T2/T1)*(Cp*T1/(Fuel_to_air_ratio*e))+1)-(Cp*T1/(Fuel_to_air_ratio*e)));
eta_total = eta_p*eta_cycle;

end
