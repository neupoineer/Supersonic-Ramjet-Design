function [T_0T,P_0P,A_Astar] = Isentropic(M)
%Equate the total/static ratios for temperature & pressure and
%calculate the area ratio using the isentropic flow relations
gamma = 1.4;
T_0T = 1+(gamma-1)/2*M^2;
P_0P = (1+(gamma-1)/2*M^2)^(gamma/(gamma-1));
A_Astar = 1/M*((2/(gamma+1))*(1+(gamma-1)/2*M^2))^((gamma+1)/(2*(gamma-1)));
end