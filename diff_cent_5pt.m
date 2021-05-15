## Copyright (C) 2021 leon
## Author: leon <leon@pop-os>
## Created: 2021-05-15

function fprime = diff_cent_5pt (f, x, h)
# Finds the derivative using the three point centered difference formula where:
  
  fprime = (  ( f(x-(2*h)) - (8*f(x-h)) + (8*f(x+h)) - (f(x+(2*h)))  ) / (12*h)  );
  
endfunction