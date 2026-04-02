load atmos_data.txt 
alt=atmos_data(:,1); 
temp=atmos_data(:,2); 
press=atmos_data(:,3); 
  
coeffs_temp=polyfit(alt,temp,1) 
coeffs_press=polyfit(alt,press,2) 
  
alt_input=[450 1111 1874 2759]; 
temp_interp=polyval(coeffs_temp,alt_input) 
press_interp=polyval(coeffs_press,alt_input) 
fprintf('The temperatures are: %.2f, %.2f, %.2f, %.2f\n',temp_interp) 
fprintf('The pressures are: %.2f, %.2f, %.2f, %.2f\n',press_interp) 
  
subplot(1,2,1) 
plot(alt,temp,'bs-') 
hold on 
plot(alt_input,temp_interp','rp-')       
title('Temperature') 
xlabel('Altitude (m)') 
ylabel('Temp (C)') 
subplot(1,2,2) 
plot(alt,press,'bs-') 
hold on 
plot(alt_input,press_interp','rp-') 
title('Pressure') 
xlabel('Altitude (m)') 
ylabel('Pressure (kPa)') 