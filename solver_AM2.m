function [y]= solver_AM2(f,t0,tn,y,h)
%   ADAMS_MOULTON_SOLVER 2 stage Method 
%   Approximates a solution to a DE 
%   f = differential equation in a form: 
%           y(t+h/2) = y(t) + h/2 * y'(t+h/2)
%   t0 -> tn =  the interval over which the evaluation occurs 
%   h = the step size
%   y = the initial state of the equation

    w0 = y;
    t1 = t0+h;
    t2 = t1+h;
    w1 = solver_Ralston(f,t1,t2,y,h)                        % Bootstrap using Runge Kutta
 
    while t1 < tn    
       wApprox = solver_AB2(f,t1,t2,y,h)                                                     % Use Adams-Bashforth for predictor
       
       wAct = w1 + 1/12 * h * ( 5*f(t2,wApprox)  + 8 * f(t1,w1) - f(t0, w0))   % Double iteration of Adams-Moulton corrector
       %w2 = w1 + 1/12 * h * ( 5*f(t2,w2)  + 8 * f(t1,w1) - f(t0, w0));
       
       w1 = wAct;  w0 = w1;                                         % Move up all the weights    
       t2 = t2 + h; t1 = t2; t0 = t1;                              % Increment all the times
    end
    y = w0;
end
