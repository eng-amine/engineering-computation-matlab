%Step 1: Find the unit vectors for each of the forces.
U1=[-cosd(30) -sind(30)];
U2=[0 -1];
U3=[cosd(50) -sind(50)];

%Step 2: Multiply the unit vectors by the respective force magnitudes.
F1=700*U1
F2=400*U2
F3=600*U3
%Written in vector form: F1=-606.2178i -350j etc.

%Find the resultant vector for the problem above.
Resultant=F1+F2+F3

%Change the format to prevent the scientific notation:
format longg
Resultant