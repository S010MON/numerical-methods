function [y] = euler_solver(f,t0,tn,y,h)
%EULER METHOD of solving differential equations
%   Generates an approximation of the states at each time step h
%   and uses it to update the current state until it reaches tn
    while t0 < tn
        y = y + f(t0,y)*h;
        t0 = t0+h;
    end
end

