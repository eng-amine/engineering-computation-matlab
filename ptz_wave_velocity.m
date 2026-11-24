clear; clc; close all;

%% 1. Dimensionless Parameters
tau_tilde = 0.25;          
tau_hat   = 1.0;          
E         = 1.0;          
E_hat     = 1.0;          
rho       = 1.0;          

c_slow    = sqrt(E / rho);                  
c_inf     = sqrt(1 / tau_tilde);            

%% 2. 0-1 and N Discretization 
N  = 100;                       % Number of spatial cells between 0 and 1
dx = 1 / N;                     % Spatial step: dx = 1/N
dt = dx / c_inf;                % Time step: dt = dx / c_inf
alpha = 0.5;                    % Second-order trapezoidal parameter

%% 3. Analytical Curves (Phase & Group Velocity)
k_vals = linspace(0.1, 180, 1000);
Re_w   = zeros(size(k_vals));

for idx = 1:length(k_vals)
    k = k_vals(idx);
    coeffs = [-1i * tau_tilde, 1, 1i * tau_hat * (c_slow^2) * (k^2), -(c_slow^2) * (k^2)];
    roots_w = roots(coeffs);
    forward_root = roots_w(real(roots_w) > 1e-6);
    Re_w(idx) = real(forward_root(1));
end

v_phase = Re_w ./ k_vals;
v_group = gradient(Re_w) ./ gradient(k_vals);

%% 4. Numerical Loop over Different Pulse Widths t_b
w_test = linspace(10, 165, 15); 
v_measured = zeros(size(w_test));

% Save xb-t data for the 5th frequency to plot the graph
example_idx = 5; 

for m = 1:length(w_test) % Resetting the Bar
    w_curr = w_test(m);
    t_b    = 2 * pi / w_curr;   % Pulse width
    
    sigma = zeros(N + 1, 1);
    eps   = zeros(N + 1, 1);
    v     = zeros(N, 1);
    
    t_max   = 0.95 / c_inf;
    n_steps = floor(t_max / dt);
    
    t_track  = [];
    xb_track = [];
    
    for j = 1:n_steps
        t_curr = j * dt;
        
        % Eq. (24): Velocity update
        v = v + (dt / (rho * dx)) * (sigma(2:end) - sigma(1:end-1));
        
        % Eq. (25): Strain update
        eps_new = eps;
        eps_new(2:end-1) = eps(2:end-1) + (dt / dx) * (v(2:end) - v(1:end-1));
        
        % Eq. (27): Stress update
        sigma_new = sigma;
        denom = (1 - alpha) + (tau_tilde / dt);
        sigma_new(2:end-1) = (((tau_tilde / dt) - alpha) * sigma(2:end-1) ...
            + E * (alpha * eps(2:end-1) + (1 - alpha) * eps_new(2:end-1)) ...
            + E_hat * (eps_new(2:end-1) - eps(2:end-1)) / dt) / denom;
        
        % Boundary conditions: Cosine pulse at x=0, Free end (sigma=0) at x=1
        if t_curr <= t_b
            sigma_new(1) = 0.5 * (1 - cos(2 * pi * t_curr / t_b));
        else
            sigma_new(1) = 0;
        end
        sigma_new(end) = 0;
        
        eps_new(1)   = (sigma_new(1) + (tau_tilde/dt)*(sigma_new(1) - sigma(1)) - E*alpha*eps(1) + (E_hat/dt)*eps(1)) / (E*(1-alpha) + E_hat/dt);
        eps_new(end) = (sigma_new(end) + (tau_tilde/dt)*(sigma_new(end) - sigma(end)) - E*alpha*eps(end) + (E_hat/dt)*eps(end)) / (E*(1-alpha) + E_hat/dt);
        
        eps   = eps_new;
        sigma = sigma_new;
        
        % Track peak position xb once the full pulse has entered the bar
        if t_curr > t_b && t_curr < (0.90 / c_inf)
            [~, max_idx] = max(sigma);
            if max_idx > 1 && max_idx < N + 1
                y1 = sigma(max_idx - 1); y2 = sigma(max_idx); y3 = sigma(max_idx + 1);
                delta = 0.5 * (y1 - y3) / (y1 - 2*y2 + y3);
                xb = ((max_idx - 1) + delta) * dx;
            else
                xb = (max_idx - 1) * dx;
            end
            t_track(end+1)  = t_curr; %#ok<SAGROW>
            xb_track(end+1) = xb;     %#ok<SAGROW>
        end
    end
    
    % Extracting Velocity with polyfit & Saving the Example Curve
    % Linear fit to xb vs t -> slope p(1) is the velocity!
    p = polyfit(t_track, xb_track, 1);
    v_measured(m) = p(1);
    
    if m == example_idx
        t_ex  = t_track;
        xb_ex = xb_track;
        p_ex  = p;
        w_ex  = w_curr;
    end
end

%% 5. Plot Both Figures
figure('Color', 'w', 'Position', [100, 100, 1100, 450]);

% Left Subplot: The xb - t curve 
subplot(1, 2, 1);
hold on; grid on; box on;
plot(t_ex(1:8:end), xb_ex(1:8:end), 'ko', 'MarkerSize', 5, 'DisplayName', 'Tracked Peak Position x_b');
plot(t_ex, polyval(p_ex, t_ex), 'r-', 'LineWidth', 1.8, ...
    'DisplayName', sprintf('Linear Fit (Slope = v = %.3f)', p_ex(1)));
xlabel('Dimensionless time (t)', 'FontSize', 11);
ylabel('Peak position (x_b)', 'FontSize', 11);
title(sprintf('Peak Trajectory x_b(t) at \\omega = %.1f', w_ex), 'FontSize', 12);
legend('Location', 'northwest');

% Right Subplot: Velocity vs Frequency 
subplot(1, 2, 2);
hold on; grid on; box on;
plot(Re_w, v_group, 'k-', 'LineWidth', 1.2, 'DisplayName', 'Group velocity');
plot(Re_w, v_phase, 'k-', 'LineWidth', 2.2, 'DisplayName', 'Phase velocity');
plot(w_test, v_measured, 'kd', 'MarkerFaceColor', 'k', 'MarkerSize', 6, ...
    'DisplayName', 'Numerical pulse velocity');
xlabel('Dimensionless angular frequency (\omega)', 'FontSize', 11);
ylabel('Dimensionless velocity', 'FontSize', 11);
title(sprintf('Dispersion Curve (\\tau = %.2f, c_\\infty = %.2f)', tau_tilde, c_inf), 'FontSize', 12);
xlim([0, 175]);
ylim([0.98, max(v_group)*1.05]);
legend('Location', 'southeast');