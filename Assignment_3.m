clc;
clear;
format long;

#************************************************#
function retval = simpson (f, a, b)

  retval = ((b-a)/6) * (f(a) + 4*f((a+b)/2) + f(b));

end%function

#************************************************#
function retval = simpson_composite (f, a, b)

  h = (b - a) / 6;
  x = a : h : b;
  sum = 0;
  
  for i = 1:length(x)
    if i == 1 || i == length(x)
      sum = sum + f(x(i));
    elseif rem(i, 2) == 0
      sum = sum + (4 * f(x(i)));
    else
      sum = sum + (2 * f(x(i)));
    end%if
  end%for
  retval  = (h/3) * sum;
  
end%function

#************************************************#
function coef = fourier_coeficients (f, a, b, n)
% Calculates the coeficients of a fourier series    
   coef = 1: (2.*n +1);
   coef(1) = 1/pi .* integral(f,a,b);
   pntr = 2;
   
   for i = 1:n   
        fcos = @(x) ( f(x).* (cos(i.*x)));
        coef(pntr) = 1/pi .* integral(fcos,a,b);
        pntr = pntr +1;
    
        fsin = @(x) ( f(x).* (sin(i.*x)));
        coef(pntr) = 1/pi .* integral(fsin,a,b);
        pntr = pntr +1;
   end%for
 end%function
 
#************************************************#
function y = fourier_function (x, c, n)
% Creates an approximate fourier function from
% c - the array of coeficients in the form a0, a1, b1, a2, b2, ... an, bn    
% n - the degree of the fourier series where:  n <= length c/2 -1    
    
    y = c(1);
    degree = 1;
    for i = 2: 2: n.*2
      y = y + (c(i).*cos((degree).*x)) + (c(i+1).*sin((degree).*x));
      degree = degree + 1;
    end%for
end%function

#************************************************#
function e = error (f, a, b, n)
% Calculates the error between f(x) and the approximation of f(x) by degree n
% f  - the function being approximated
% x - the value for which to approximate
% n - the degree of the fourier series
    
    c = fourier_coeficients (f, a, b, n);  
    sigma = 0;
    for i = 2:length(c)
      sigma = sigma + c(i).^2;
    endfor
    e = pi.*sigma;
    
end%function
#************************************************#

fprintf("\n**********************************************\n");
fprintf("\nAssignment 3 - 6252320 - Leon Debnath\n");
fprintf("\n**********************************************\n");
fprintf("\nPart 1:  Approximate the Integral of f(x) by Simpson's rule\n\n");
f = @(x) 1 ./ (1 + x .^ 2)
a = 1;
b = 2;
matlab_method = integral(f,a,b)
simple_simpson = simpson(f,a,b)
composite_simpson = simpson_composite(f,a,b)

fprintf("\n**********************************************\n");
fprintf("\nPart 2:  Approximate g(x) by a Fourier sum to degree 6\n\n");
g = @(x) (cos (2 .* x) ./ (3 + 2 .* sin (x)))
c = fourier_coeficients(g,-pi,pi,6)
fprintf("\nIn this array, a0 is the first term, with ai and bi alternating subsequently\n\n");


fprintf("\n**********************************************\n");
fprintf("\nPart 3: Plot f(x) for degree 1, 2, and 3\n\n");

f1 = @(x) fourier_function(x, c, 1);
f2 = @(x) fourier_function(x, c, 2);
f3 = @(x) fourier_function(x, c, 3);

fplot(g,[-pi,pi], 'b')
hold on;
fplot(f1,[-pi,pi], 'r')
fplot(f2,[-pi,pi], 'r')
fplot(f3,[-pi,pi], 'r')
hold off;

fprintf("\n**********************************************\n");
fprintf("\nPart 4: Calculate the approximation error for degree 1 - 6\n\n");
for i = 1:6
  error(g,-pi,pi,i)
end%for
  
  
  