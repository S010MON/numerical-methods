clc
clear all
t0 = 0;
tn = 1;
y = 2/3;
h = 0.25;
 f = @(t,y) (y+t)^2 - 1;