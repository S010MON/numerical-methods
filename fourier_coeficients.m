
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
