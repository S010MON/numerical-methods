function [q] = newton_raphson_method(f,p,e)
%NEWTON_RAPHSON_METHOD Summary of this function goes here
%   Detailed explanation goes here
df = polyder(f);
    while(f(p)/df(p) > e)
        
    end
end

