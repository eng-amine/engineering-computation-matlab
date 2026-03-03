% The position, speed, and acceleration equations for a particle are given as  
% 𝑥 =2𝑡^3 −24𝑡+6 
% 𝑣 =6𝑡^2 −24 
% 𝑎 =12𝑡 
% Plot the position (𝑥), speed (𝑣) and acceleration (𝑎) for the particle together on one plot 
% for time ranging from 0 to 4 seconds, in increments of 0.1 seconds.  Use the following 
% formats: 
% Position – dotted green line with * markers 
% Speed – dashdot black line with circle markers 
% Acceleration – solid yellow line with hexagram markers 
% x-axis – go from -1 to 5 
% y-axis – go from -30 to 75 
% x-axis label – ‘time (sec)’ 
% y-axis label – none 
% add a legend – be sure to include units 
% turn grid lines on 
% title:  ‘Position, Speed, and Acceleration of Particle A’  

t=0:0.1:4;
x=2*t.^3-24*t+6;
v=6*t.^2-24;
a=12*t;
plot(t,x, 'g:*');
hold on
plot(t,v, '-.ko');
plot(t,a, '-yh');
axis([-1 5 -30 75])
xlabel('time(s)')
legend('Position(m)', 'Velocity(m/s)', 'Acceleration(m/s^2)')
grid on
title('Position, Speed, and Acceleration of Particle A')