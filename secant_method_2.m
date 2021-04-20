function [r] = secant_method_2(f,p,q,e,y)
%SECANT_METHOD 
%   Find the secant line between p and q
%   Set the y value to zero on that line, assign to R
%   Iterate through until q-p is smaller than the error e
    while(abs(q-p) > e)
        r = q - ((q-p)/(f(q,y)-f(p,y)))*f(q,y);
        p = q;
        q = r;
    end
end

