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
fprintf("\nIn this array, a0 is the first term, with ai and bi alternating subsequently\n\n");
c = fourier_coeficients(g,-pi,pi,6)
