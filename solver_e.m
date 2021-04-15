function [y] = solver_e(f,t0,tn,y,h)
%EULER METHOD
%   Give a differential equation f(t,y)generates an approximation
%   of the solution by stepping from t0 to tn in increments of h
%   at each step it ypdates the new y value before using it for the next
%   calculation

    while t0 < tn               % While the current step is smaller than the final
        y = y + f(t0,y)*h;      % Calculate the difference in y by adding f(t,y)*h  
        t0 = t0+h;              % Increment the step counter
    end
end

