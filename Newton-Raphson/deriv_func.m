function [dfp] = deriv_func( po )
dfp=2*po-5-10*cos(po)*exp(sin(po));
end