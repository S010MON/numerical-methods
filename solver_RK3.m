function y = solver_RK3(f,t0,tn,y,h)
%   RUNGE_KUTTA_SOLVER 3rd order - Heun Method 
%   Approximates a solution to a DE 
%   f = differential equation in a form: 
%           y(t+h/2) = y(t) + h/2 * y'(t+h/2)
%   t0 -> tn =  the interval over which the evaluation occurs 
%   h = the step size
%   y = the initial state of the equation

    w0 = y;
    while t0 < tn
      
       k1 = h * f(t0,w0);                                               
       k2 = h * f((t0 + (h/3)) , (w0 + (k1/3)));              
       k3 = h * f((t0 + (2*h/3)) , (w0 + (2*k2/3)));        
       w1 = w0 + 1/4 * ( k1 + (3*k3));                         
       
       w0 = w1;
       t0 = t0+h;
    endwhile
    y = w1;
endfunction
