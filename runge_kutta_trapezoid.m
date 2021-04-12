function y = runge_kutta_trapezoid (f,t0,tn,y,h)
%   RUNGE_KUTTA_SOLVER trapezoid Method 
%   Approximates a solution to a DE 
%   f = differential equation in a form: 
%           y(t+h/2) = y(t) + h/2 * y'(t+h/2)
%   t0 -> tn =  the interval over which the evaluation occurs 
%   h = the step size
%   y = the initial state of the equation

    w0 = y;
    while t0 < tn
       % Calculate left endpoint
       a = f(t,w0);
       % Calcualte right endpoint
       b = f((t+h), (w0+a));
       % set the next state to the average of the two endpoints
       w1 = w0 + h/2*(a+b);
       
       w0 = w1;
       t0 = t0+h;
    endwhile
    y = w1;
endfunction
