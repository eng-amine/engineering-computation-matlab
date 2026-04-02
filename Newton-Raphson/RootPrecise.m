format long
po=-1;
tol=10^-8;
fp=@(po) po.^2-5*po+4-10*exp(sin(po));
estimate=newton(fp,@deriv_func,po,tol);
x=-2:.05:10;
plot(x,fp(x))
grid on