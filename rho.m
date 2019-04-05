function out = rho(x,l,u)
%takes three arguments
%returns output of piecewise function
if x < l
    out = l;
elseif u < x
    out = u;
else
    out = x;
end
end