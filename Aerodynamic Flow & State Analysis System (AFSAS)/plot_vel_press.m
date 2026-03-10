function  plot_vel_press(T2,P2,V2)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
subplot(1,3,1)
plot(P2,V2,'r')
xlabel('Pressure')
ylabel('Velocity')
title('Pressure vs. Velocity fro Isentropic Flow')

subplot(1,3,2)
plot(T2,P2,'c')
xlabel('Temperature')
ylabel('Pressure')
title('Temperature vs. Pressure fro Isentropic Flow')

subplot(1,3,3)
plot(T2,V2,'m')
xlabel('Temperature')
ylabel('Velocity')
title('Temperature vs. Velocity fro Isentropic Flow')
axis tight
end