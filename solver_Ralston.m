function [y]= solver_Ralston(f,t0,tn,y,h)
%RALSTON_SOLVER 
%   Utilises the Ralston method to generate an approximate solution to a
%   differential equation 
%   f = differential equation in a form: 
%           y(t+h/2) = y(t) + h/2 * y'(t+h/2)
%   t0 -> tn =  the interval over which the evaluation occurs 
%   h = the step size
%   y = the initial state of the equation

    w0 = y;
    while t0 < tn
       k1 = h * f(t0,w0);                                               
       k2 = h * f((t0 + (2*h/3)) , (w0 + (2*k1/3)));       
       w1 = w0 + (1/4 * k1) + (3/4 *k2);                           
     
       w0 = w1;
       t0 = t0+h;
    endwhile
    y = w1;
endfunction

