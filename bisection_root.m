function [r] = bisection_root(f,a,b,e)
%BISECTION_ROOT Summary of this function goes here
%   Solve F(x)=0 for x in [a,b] up to a tolerance of e

% These parts should check that conditions are correct before running,
% no idea why it doesn't work!
% assert a<b; 
% assert e>0;
% assert (sign(f(a))==-sign(f(b)));

    while (b-a)/2 > e
        c=(a+b)/2;
        if sign(f(c))==sign(f(a))
            a = c;
        else
            b = c;
        end
    end
r = (a+b)/2;      
end

