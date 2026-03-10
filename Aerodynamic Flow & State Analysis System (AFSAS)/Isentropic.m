function temp2 = Isentropic(P1,temp1,P2)
%this function uses the isentropic relationship to calculate the 
% temperature at point 2.
temp2=temp1*(P2/P1).^(1/3.5);
end