% Isentropic flow relationships are used for studying the airflow around an airfoil during high-speed flight. 
% The flow relationships, along with the ideal gas law, let you compare one point on a streamline to another point – see the figure below.   

% Ideal gas law (for any point):  P=Rho*R*T (R=1716) 

% Isentropic flow equation: (P2/P1)=(T2/T1)^3.5

% Energy balance:  Cp*T1 + 0.5V1^2 = Cp*T2 + 0.5V2^2  (Cp = 6006)  (Note: velocities must be in ft/s) 

% Assume that point 1 has the following conditions: pressure (P1) =2116 lb/ft2, velocity (V1) = 500 miles/hr, 
% and density ( ρ1)=0.002377 slug/ft3.  Find the temperature (T2) and velocity (V2) at point 2 for pressure 
% (P2) values of 1000 to 2000 lb/ft2  in increments of 10.  Plot the following: P2 vs V2, T2 vs. P2, T2 vs. V2 .  
% Create a modular program as follows: 
% 1. Create and call (from the script) the following functions: 
% a. Inputs.m – This function initializes and returns the point 1 values and any other 
% needed constants. Use input statements to collect values from the user. 
% b. Ideal_gas_law.m – this function calculates the temperature at point 1. 
% c. Isentropic.m – this function uses the isentropic relationship to calculate the 
% temperature at point 2. 
% d. Velocity.m – this function uses the energy balance equation to calculate the 
% velocity at point 2.  
% e. Plot_vel_vs_press.m – this function creates the three plots.  The plots should be 
% in the format shown below. 
% Your final output should be a plot like the one shown (the plot shown has been rotated to fit it on the 
% page).  Note:  The main script is used only to initialize variables and call the functions.  Do not do 
% calculations in the main script.

[P1,V1,Rho1,P2,Cp,R]=inputs;
T1=Ideal_gas_law(P1,Rho1,R);
T2=Isentropic(P1,T1,P2);
V2=velocity(Cp,T1,V1,T2);
plot_vel_press(T2,P2,V2)