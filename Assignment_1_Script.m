clear all;
clc;
format long;

f = @(y,t) cos(t) + y − y^3;
h = 0.1;
t0 = 0;
tn = 6;
y = 2;

pStar = solver_AB3(f,t0,tn,y,h);
p = −0.484509247;