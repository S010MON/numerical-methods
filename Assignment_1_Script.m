clear all;
clc;
format long;
% 6252320 Leon Debnath - Assignment 1
% *****************************************************************************
function y = solver_RK3(f,t0,y0,h)
%   RUNGE_KUTTA_SOLVER 3rd order - Heun Method
%   Approximates a single step in the solution of a DE
%   f = differential equation in a form:
%           y(t+h/2) = y(t) + h/2 * y'(t+h/2)
%   t0 -> tn =  the interval over which the evaluation occurs
%   h = the step size
%   y = the initial state of the equation
    tn = t0+h;
    k1 = h * f(t0,y0);
    k2 = h * f((t0 + (h/3)) , (y0 + (k1/3)));
    k3 = h * f((t0 + (2*h/3)) , (y0 + (2*k2/3)));
    y = y0 + 1/4 * ( k1 + (3*k3))
endfunction
% *****************************************************************************
function [y]= solver_AB3(f,t0,tn,y,h)
%   ADAMS_BASHFORTH_SOLVER 3 stage Method
%   Approximates a solution to a differential equation in a form:
%   f = y(t+h/2) = y(t) + h/2 * y'(t+h/2)
%   t0 -> tn =  the interval over which the evaluation occurs
%   h = the step size
%   y = the initial state of the equation

    t1 = t0 + h;
    t2 = t1 + h;
    w0 = y;
    w1 = solver_RK3(f,t0,w0,h)                 % Bootstrap the first two steps
    w2 = solver_RK3(f,t0,w1,h)

    while t0 < tn
       wi = w1 + 1/12 * h * ( 23*f(t2,w2) - 16* f(t1, w1) + 5*f(t0,w0))
        
       w2 = wi; w1 = w2; w0 = w1;                  % Move up all the weights
       t2 = t2+h; t1 = t1+h; t0 = t0+h;            % Increment all the times
    endwhile
    y = wi;
endfunction
% *****************************************************************************
function [root]= solver_AB3_root(f,t0,tn,y,h)
%   ADAMS_BASHFORTH_SOLVER 3 stage Method
%   An ammended version that returns the time at the point where the
%   value of wi crosses the x axis
%   Approximates a solution to a differential equation in a form:
%   f = y(t+h/2) = y(t) + h/2 * y'(t+h/2)
%   t0 -> tn =  the interval over which the evaluation occurs
%   h = the step size
%   y = the initial state of the equation
    
    w0 = y;
    t1 = t0 + h;
    w1 = solver_RK3(f,t0,w0,h)                 % Bootstrap the first two steps
    
    t2 = t1 + h;
    w2 = solver_RK3(f,t1,w1,h)
    root = 0;

    while t0 < tn
       wi = w1 + 1/12 * h * ( 23*f(t2,w2) - 16* f(t1, w1) + 5*f(t0,w0))
        
        if (wi < 0 && w2 > 0)
         root = [t2+h, wi;
                          t2,w2];
        endif
        
       w2 = wi; w1 = w2; w0 = w1;                  % Move up all the weights
       t2 = t2+h; t1 = t1+h; t0 = t0+h;            % Increment all the times
    endwhile
    y = wi;
endfunction
% *****************************************************************************
function [r] = secant_method(f,p,q,e,y0)
%SECANT_METHOD
%   Find the secant line between p and q
%   calculate root of the function
%   Iterate through until q-p is smaller than the error e
    
    while(abs(q-p) > e)
        r = q - ((q-p)/(f(q)-f(p)))*f(q);
        p = q;
        q = r;
    endwhile
endfunction
% *****************************************************************************
f = @(t,y) sin(t) + y - (y^3);
y = 2;
t0 = 0;
tn = 6;

fprintf("Adams-Bashforth Method with step size: 0.1\n");
h = 0.1;
approx = solver_AB3(f,t0,tn,y,h)
exact = -0.6599693029
error = abs((approx-exact))

fprintf("\nAdams-Bashforth Method with step size: 0.05\n");
h = 0.05;
approx = solver_AB3(f,t0,tn,y,h)
exact =  -0.6599693029
error = abs((approx-exact))

fprintf("\nFind t for y(t) = 0+/- h using Adams-Bashforth root method\n");
h = 0.1;
root = solver_AB3_root(f,t0,tn,y,h)

fprintf("\nFind y(t) = 0 using Secant method over interval:\n");
p = root(1,1)
q = root(2,1)
y0 = root(1,2)
e = 0.0001;
fprime = @(t) solver_RK3(f,p,y0, t-p);
secant_method(fprime,p,q,e,y0)


