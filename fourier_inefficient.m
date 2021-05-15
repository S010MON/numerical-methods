
function retval = fourier_inefficient (f, a, b)

     a0 =  1/pi .* integral(f,a,b)
     f1 = @(x) ( f(x).* cos(x))
     a1 = 1/pi .* integral(f1,a,b)
     f2 = @(x) ( f(x).* cos(2.*x))
     a2 = 1/pi .* integral(f2,a,b)
     f3 = @(x) ( f(x).* cos(3.*x))
     a3 = 1/pi .* integral(f3,a,b)
   
endfunction
