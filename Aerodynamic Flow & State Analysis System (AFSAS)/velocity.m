function V2 = velocity(Cp,T1,V1,T2)
%this function uses the energy balance equation to calculate the 
% velocity at point 2
v=V1*(5280/3600);
const=Cp*T1 + .5*v^2;
V2=((const - Cp*T2)*2).^.5;
end