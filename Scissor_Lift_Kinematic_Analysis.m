% Scissor Lift Kinematic Analysis
% Parameters: a = 3.75m, b = 0.67m, phi range [10, 80] degrees


% 1. Define Constants
a = 3.75; % Platform dimensions
b = 0.67; % Link dimensions
W = 1000; % Assigned load weight (Newton)

% 2. Define Angle Range (phi)
phi_deg = 10:1:80; % From 10 to 80 degrees
phi_rad = deg2rad(phi_deg);

% 3. Calculate Mechanical Advantage (eta)
% Formula derived from static equilibrium: eta = W / F
% eta(phi) = (8*b*sin(phi)) / (3 * sqrt(a^2 + 4*b^2 - 4*a*b*cos(2*phi)))
numerator = 8 * b * sin(phi_rad);
denominator = 3 * sqrt(a^2 + 4*b^2 - 4*a*b*cos(2*phi_rad));
eta = numerator ./ denominator;

% 4. Calculate Required Actuator Force (F)
% Since eta = W/F, then F = W / eta
F_force = W ./ eta;

% 5. Plotting the Results
figure('Name', 'Scissor Lift Analysis');

% Plot 1: Mechanical Advantage
subplot(2,1,1);
plot(phi_deg, eta, 'LineWidth', 2, 'Color', 'b');
grid on;
title('Mechanical Advantage (\eta) vs. Platform Angle (\phi)');
xlabel('\phi (degrees)');
ylabel('\eta');
xlim([10 80]);

% Plot 2: Required Input Force
subplot(2,1,2);
plot(phi_deg, F_force, 'LineWidth', 2, 'Color', 'r');
grid on;
title('Required Input Force (F) vs. Platform Angle (\phi)');
xlabel('\phi (degrees)');
ylabel('Force (N)');
xlim([10 80]);

fprintf('Analysis Complete. Plotting relationship for a=%.2f and b=%.2f\n', a, b);