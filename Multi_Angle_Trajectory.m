vo = input('Enter initial velocity: '); % initial velocity, m/s
a = -9.81; % acceleration, m/s^2
hold on % put multiple plots on one figure
% loop through each angle and plot the trajectory
for angle=0:10:90
 vox = vo*cosd( angle ); % initial x-velocity
 voy = vo*sind( angle ); % initial y-velocity
 tf = -2*voy/a; % time of flight
 t = linspace(0,tf); % create time points for the trajectory plot
 x = vox * t; % x-position at each point in time
 y = voy * t + 0.5*a*t.^2; % y-position at each point in time
 plot( x, y) % plot the trajectory that corresponds to the angle.
 % Find the point where y is at a max value. Put the corresponding
 % angle on the plot at this location.
 text(max(x)/2,max(y),num2str(angle))
end
grid on
axis tight
xlabel('x (m)')
ylabel('y (m)')
title('Projectile Trajectories')
