clc;
clear;
format long;

c = [1.01,0,-5.26,-0.0173,0.839,-1.91];
x = 2.39;
n = 3;
r = @(x) rnd(x,n);

fprintf("f(x) at x = 2.39 direct unrounded\n");
f = @(x) c(1)*x^5 + c(2)*x^4 + c(3)*x^3 + c(4)*x^2 + c(5)*x + c(6);
p1 = f(x)

fprintf("f(x) at x = 2.39 direct rounded  to 3sf\n");
fRnd = @(x) r(r(r(r(r(r(r(r(r(r(c(1)*x)*x)*x)*x)*x)+r(r(r(r(c(2)*x)*x)*x)*x)) + r(r(r(c(3)*x)*x)*x)) +  r(r(c(4)*x)*x)) + r(c(5)*x)) + c(6));
p2 = fRnd(x)

fprintf("Direct evaluation absolute error\n");
abs(p1 - p2)

fprintf("Direct evaluation relative error\n");
(abs(p2 - p1))/(abs(p1))

fprintf("f(x) at x = 2.39 nested unrounded\n");
fN = @(x) ((((c(1)*x + c(2))*x + c(3))*x + c(4))*x + c(5))*x + c(6);
p1 = fN(x)

fprintf("f(x) at x = 2.39 nested rounded to 3sf\n");
fNRnd = @(x) r(r(r(r(r(r(r(r(r(r(c(1)*x) + c(2))*x) + c(3))*x) + c(4))*x) + c(5))*x) + c(6));
p2 = fNRnd(x)

fprintf("Horner nested form absolute error\n");
(abs(p1 - p2))

fprintf("Horner nested form relative error\n");
(abs(p2 - p1))/(abs(p1))


fprintf("The direct evaluation performs better in both respects\n");
