function [y]= solver_AB4(f,t0,tn,y,h)
%   ADAMS_BASHFORTH_SOLVER 4 stage Method 
%   Approximates a solution to a DE 
%   f = differential equation in a form: 
%           y(t+h/2) = y(t) + h/2 * y'(t+h/2)
%   t0 -> tn =  the interval over which the evaluation occurs 
%   h = the step size
%   y = the initial state of the equation
 
    t1 = t0 + h;
    t2 = t1 + h;
    t3 = t2 + h;
    w0 = y;
    w1 = solver_RK4(f,t0,t1,w0,h);                 % Bootstrap the first steps
    w2 = solver_RK4(f,t0,t1,w1,h);                
    w3 = solver_RK4(f,t0,t1,w1,h);     
    
    while t0 < tn    
       w4 = w3 + 1/24 * h * ( 55*f(t3,w3) - 59 * f(t2, w2) + 37 * f(t1,w1) - 9 * f(t0,w0));
       
       w3 = w4;       % Move up all the weights
       w2 = w3; 
       w1 = w2; 
       w0 = w1;                              
       t3 = t3 + h;     % Increment all the times
       t2 = t2 + h; 
       t1 = t1 + h; 
       t0 = t0 + h;            
    end
    y = w4;
end
