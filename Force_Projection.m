%Step 1: Put the coordinates of A, B, C into three vectors
A=[1.3 1.12];
B=[-1.19 0.60];
C=[0.54 0];

%Step 2: Use the above coordinates to find position vectors rA and rB
rA=A-C
rB=B-C

%Step 3: Use the position vectors from above to calculate the unit vectors for the two cables.
uA=rA/norm(rA)
uB=rB/norm(rB)

%Step 4: Calculate force vectors
FA=500*uA
FB=250*uB

%Step 5: Projection on a line requires the dot product.
Projection = dot(FA,uB)