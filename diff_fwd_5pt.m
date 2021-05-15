## Copyright (C) 2021 leon
## Author: leon <leon@pop-os>
## Created: 2021-05-15

function fprime = diff_fwd_5pt (f, x, h)
# Finds the derivative using the three point centered difference formula where:
  
  fprime = ((  (-25* f(x)) +  (48*f(x+h)) - (36*f(x+(2*h))) + (16*f(x+(3*h))) - (3*f(x+(4*h)))  ) / (12*h)  );
  
endfunction