clear all;
clc;
format long;

f = @(t,y) cos(t) + y - (y^3);
y = 2;
t0 = 0;
tn = 6;

fprintf("Step size: 0.1\n");
h = 0.1; 
approx = solver_AB3(f,t0,tn,y,h)
exact = -0.484509247
error = abs((approx-exact))


fprintf("\nStep size: 0.05\n");
h = 0.05; 
approx = solver_AB3(f,t0,tn,y,h)
exact = -0.484509247
error = abs((approx-exact))


fprintf("\nFind y(t) = 0\n");
h = 0.5; 
i = solver_AB3_Root(f,t0,tn,y,h)
t = i * h                       

 p = t-h
 q = t+h
 e = 0.00001;
 t = secant_method(f,p,q,e)

 solver_AB3(f,t0,t,y,0.001)


