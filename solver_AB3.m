function [y]= solver_AB3(f,t0,tn,y,h)
%   ADAMS_BASHFORTH_SOLVER 3 stage Method 
%   Approximates a solution to a DE 
%   f = differential equation in a form: 
%           y(t+h/2) = y(t) + h/2 * y'(t+h/2)
%   t0 -> tn =  the interval over which the evaluation occurs 
%   h = the step size
%   y = the initial state of the equation
 
    t1 = t0 + h;
    t2 = t1 + h;
    w0 = y;
    w1 = solver_RK3(f,t0,t1,w0,h);                 % Bootstrap the first step
    w2 = solver_RK3(f,t0,t1,w1,h);                
    
    while t0 < tn    
       w3 = w1 + 1/12 * h * ( 23*f(t2,w2) - 16* f(t1, w1) + 5*f(t0,w0));
       
       w2 = w3; w1 = w2; w0 = w1;                  % Move up all the weights       
       t2 = t2+h; t1 = t1+h; t0 = t0+h;             % Increment all the times
    end
    y = w3;
end
