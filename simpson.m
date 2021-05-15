
function retval = simpson (f, a, b)

  retval = ((b-a)/6) * (f(a) + 4*f((a+b)/2) + f(b));

endfunction
