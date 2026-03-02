%27. Solve the following system of linear equations
% 3x+2y-z=10
% -x+3y+2z=5
% x-y-z=-1

%Step 1: Form matrix A.
A=[3 2 -1; -1 3 2;1 -1 -1]

%Step 2: Form matrix b.
b=[10;5;-1]

%Step 3: Calculate C
C=A^-1*b