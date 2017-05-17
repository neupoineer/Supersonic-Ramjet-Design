function [M2,PyPx]=ShockRelations(M1)
% Normal shock relations which output the downstream Mach number, M2, and
% the static pressure ratio accross the shock.
gamma=1.4;
M2 = sqrt(((gamma-1)*M1^2+2)/(2*gamma*M1^2-(gamma-1)));
PyPx = (2*gamma*M1^2-(gamma-1))/(gamma+1) ;
end