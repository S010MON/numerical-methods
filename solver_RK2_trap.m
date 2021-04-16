function [y] = solver_RK2_trap(f,t0,tn,y,h)
%   RUNGE_KUTTA_SOLVER trapezoid Method 
%   Approximates a solution to a DE 
%   f = differential equation in a form: 
%           y(t+h/2) = y(t) + h/2 * y'(t+h/2)
%   t0 -> tn =  the interval over which the evaluation occurs 
%   h = the step size
%   y = the initial state of the equation

    w0 = y;
    while t0 < tn
       %w1 = w0 + (h/2) * ( f(t0,w0) + f((t0+h), (w0+h) * f(t0, w0)));
       
       a = f( t0, w0 );                             % Calculate left endpoint
       b = f(( t0 + h), (w0 + h) * a);       % Calcualte right endpoint
       w1 = w0 + (h/2) * (a+b);             % set the next state to the average of the two endpoints
       
       w0 = w1;
       t0 = t0+h;
    endwhile
    y = w1;
endfunction
