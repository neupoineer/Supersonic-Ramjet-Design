%% Advanced Propulsion: Ramjet Design
% The purpose of this main file is to vary the desired input parameters to
% determine their individual effect on the engine efficiencies. 
%
% Written by: Sean Cartmale, Federico Semeraro, Conor Wilson.
% Date: 17/03/2017

% Housekeeping
close all; clear; clc;

% Initialize all parameters
[P_inf,T_inf,M_inf,Shockstrength,M_burner,T_burner,T_req,gamma,R,Cp] = RamjetParameters();

% Number of points when varying parameters
n = 100;
% Defining the legend to be used
leg = {'$\eta_{p}$','$\eta_{cycle}$','$\eta_{t}$'};

%% Varying free stream pressure
% Pressure varies from 10kPa to 1000kPa
P_inf = linspace(10e3,1000e3,n);
for i = 1:length(P_inf)
    % For each value of pressure, design an engine and return the efficiencies:
    [eta_p(i),eta_cycle(i),eta_total(i)] = Ramjet(P_inf(i),T_inf,M_inf,...
        Shockstrength,M_burner,T_burner,T_req,gamma,R,Cp);
end
plot_latex(P_inf,eta_p,eta_cycle,eta_total,'Efficiency against $P_\infty$',...
    'Upstream Pressure, $P_\infty$ (Pa)','Efficiency',leg,'northeast');


%% Varying free stream temperature
% Reinitialize all parameters
[P_inf,T_inf,M_inf,Shockstrength,M_burner,T_burner,T_req,gamma,R,Cp] = RamjetParameters();

% Temperature varies from 100K to 1000K
T_inf = linspace(100,1000,n);
for i = 1:length(T_inf)
    % For each value of temperature, design an engine and return the efficiencies:
    [eta_p(i),eta_cycle(i),eta_total(i)] = Ramjet(P_inf,T_inf(i),M_inf,...
        Shockstrength,M_burner,T_burner,T_req,gamma,R,Cp);
end
plot_latex(T_inf,eta_p,eta_cycle,eta_total,'Efficiency against $T_\infty$',...
    'Upstream Temperature, $T_\infty$ (K)','Efficiency',leg,'southeast');


%% Varying flight Mach number
% Reinitialize all parameters
[P_inf,T_inf,M_inf,Shockstrength,M_burner,T_burner,T_req,gamma,R,Cp] = RamjetParameters();

% Flight Mach number varies from 0.5 to 10
M_inf = linspace(0.5,10,n);
for i = 1:length(M_inf)
    % For each value of flight Mach number, design an engine and return the efficiencies:
    [eta_p(i),eta_cycle(i),eta_total(i)] = Ramjet(P_inf,T_inf,M_inf(i),...
        Shockstrength,M_burner,T_burner,T_req,gamma,R,Cp);
end
plot_latex(M_inf,eta_p,eta_cycle,eta_total,'Efficiency against $M_\infty$',...
    'Upstream Mach Number, $M_\infty$','Efficiency',leg,'southeast');


%% Varying the normal shock strength
% Reinitialize all parameters
[P_inf,T_inf,M_inf,Shockstrength,M_burner,T_burner,T_req,gamma,R,Cp] = RamjetParameters();

% Shockstrength varies from 1 to 7
Shockstrength = linspace(1,7,n);
for i = 1:length(Shockstrength)
    % For each value of normal shock strenght, design an engine and return the efficiencies:
    [eta_p(i),eta_cycle(i),eta_total(i)] = Ramjet(P_inf,T_inf,M_inf,...
        Shockstrength(i),M_burner,T_burner,T_req,gamma,R,Cp);
end
plot_latex(Shockstrength,eta_p,eta_cycle,eta_total,'Efficiency against Normal Shock Strength',...
    'Normal Shock Strength','Efficiency',leg,'northeast');


%% Varying burner entry Mach number
% Reinitialize all parameters
[P_inf,T_inf,M_inf,Shockstrength,M_burner,T_burner,T_req,gamma,R,Cp] = RamjetParameters();

% Burner entry Mach number varies from 0 to 2
M_burner = linspace(0,2,n);
for i = 1:length(M_burner)
    % For each value of burner entry Mach number, design an engine and return the efficiencies:
    [eta_p(i),eta_cycle(i),eta_total(i)] = Ramjet(P_inf,T_inf,M_inf,...
        Shockstrength,M_burner(i),T_burner,T_req,gamma,R,Cp);
end
plot_latex(M_burner,eta_p,eta_cycle,eta_total,'Efficiency against $M_{burner}$',...
    'Burner Entry Mach Number $M_{burner}$','Efficiency',leg,'northeast');


%% Varying burner temperature
% Reinitialize all parameters
[P_inf,T_inf,M_inf,Shockstrength,M_burner,T_burner,T_req,gamma,R,Cp] = RamjetParameters();

% Burner entry temperature varies from 100 to 3000
T_burner = linspace(100,3000,n);
for i = 1:length(T_burner)
    % For each value of burner temperature, design an engine and return the efficiencies:
    [eta_p(i),eta_cycle(i),eta_total(i)] = Ramjet(P_inf,T_inf,M_inf,...
        Shockstrength,M_burner,T_burner(i),T_req,gamma,R,Cp);
end
plot_latex(T_burner,eta_p,eta_cycle,eta_total,'Efficiency against $T_{burner}$',...
    'Burner Temperature, $T_{burner}$ (K)','Efficiency',leg,'northeast');


%% Varying required thrust
% Reinitialize all parameters
[P_inf,T_inf,M_inf,Shockstrength,M_burner,T_burner,T_req,gamma,R,Cp] = RamjetParameters();

% Burner entry Mach number varies from 5kN to 500kN
T_req = linspace(5e3,500e3,n);
for i = 1:length(T_req)
    % For each value of required thrust, design an engine and return the efficiencies:
    [eta_p(i),eta_cycle(i),eta_total(i)] = Ramjet(P_inf,T_inf,M_inf,...
        Shockstrength,M_burner,T_burner,T_req(i),gamma,R,Cp);
end
plot_latex(T_req,eta_p,eta_cycle,eta_total,'Efficiency against Required Thrust',...
    'Required Thrust (N)','Efficiency',leg,'northeast');