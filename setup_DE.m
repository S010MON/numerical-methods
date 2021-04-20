clear all;
clc;
format long;

f = @(t,y) exp(-1*t) - y^2;
y = 0;
t0 = 0;
tn = 1;
h = 0.001; 


approx = solver_AB3(f,t0,tn,y,h)
exact = 0.503347
error = absError(exact, approx)