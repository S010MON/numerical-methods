function [y]= runge_kutta_solver(f,t0,tn,y,h)
%RUNGE_KUTTA_SOLVER Midpoint Method 
%   Utilises the Midpoint Method to generate an approximate solution to a
%   differential equation using a Euler method form: 
%           y(t+h/2) = y(t) + h/2 * y'(t+h/2)

    w0 = y;
    while t0 < tn
       a = t0+h/2;
       b = w0+h/2*f(t0,w0);
       w1 = w0 + (f(a,b)*h);
       
       w0 = w1;
       t0 = t0+h;
    end
    y = w1;
end

