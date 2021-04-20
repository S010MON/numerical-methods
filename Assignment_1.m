clear;
clc;
format long;
fprintf("6252320 Leon Debnath - Assignment 1\n\n");

f = @(t,y) cos(t) + y - (y^3);
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
exact = -0.484509247
error = abs((approx-exact))

fprintf("\nFind t for y(t) = 0+/- h using Runge-Kutta method\n");
h = 0.5;
i = solver_AB3_Root(f,t0,tn,y,h);
t = i * h

fprintf("\nFind y(t) = 0 using Secant method over interval:\n");
 p = t-h
 q = t+h
 e = 0.00001;
 t = secant_method(f,p,q,e)


 % *****************************************************************************
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
    end
    y = w1;
end
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
    w1 = solver_RK3(f,t0,t1,w0,h);                 % Bootstrap the first two steps
    w2 = solver_RK3(f,t0,t1,w1,h);

    while t0 < tn
       w3 = w1 + 1/12 * h * ( 23*f(t2,w2) - 16* f(t1, w1) + 5*f(t0,w0));

       w2 = w3; w1 = w2; w0 = w1;                  % Move up all the weights
       t2 = t2+h; t1 = t1+h; t0 = t0+h;            % Increment all the times
    end
    y = w3;
end
% *****************************************************************************
function [i]= solver_AB3_Root(f,t0,tn,y,h)
%   ADAMS_BASHFORTH_SOLVER 3 stage Method
%   Adaptation of Adams-Bashford 3 state solver method that returns the index i
%   when y = 0 +/- h for a differential equation in a form:
%   f =  y(t+h/2) = y(t) + h/2 * y'(t+h/2)
%   t0 -> tn =  the interval over which the evaluation occurs
%   h = the step size
%   y = the initial state of the equation

    t1 = t0 + h;
    t2 = t1 + h;
    w0 = y;
    w1 = solver_RK3(f,t0,t1,w0,h);                  % Bootstrap the first step
    w2 = solver_RK3(f,t0,t1,w1,h);
    w3 = inf;                                       % Initialise w3 to infinity for the while loop
     i = 2;                                         % Set i=2 as w1 and w2 have been calculated

    while  -h < w3 || w3 > h
       w3 = w1 + 1/12 * h * ( 23*f(t2,w2) - 16* f(t1, w1) + 5*f(t0,w0));
       i = i + 1;
       w2 = w3; w1 = w2; w0 = w1;                   % Move up all the output values
       t2 = t2+h; t1 = t1+h; t0 = t0+h;             % Increment all the times
    end
end
% *****************************************************************************
function [r] = secant_method(f,p,q,e)
%   SECANT_METHOD
%   Find the secant line between p and q
%   Set the y value to zero on that line, assign to R
%   Iterate through until q-p is smaller than the error e
    while(abs(q-p) > e)
        r = q - ((q-p)/(f(q,0)-f(p,0)))*f(q,0);
        p = q;
        q = r;
    end
end
% *****************************************************************************
