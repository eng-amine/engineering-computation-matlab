function [p] = newton( fp,dfp,po,tol )
   n=100;
   error=100;
   i=0;
   while (i<n & error>tol)
       p=po-(fp(po)/dfp(po));
       error=abs(p-po);
       i=i+1;
       po=p;
   end
 end