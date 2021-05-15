## Copyright (C) 2021 leon
## Author: leon <leon@pop-os>
## Created: 2021-05-15

function fprime = diff_cent_3pt (f, x, h)
# Finds the derivative using the three point centered difference formula where:
  
  fprime = ((f(x+h) - f(x-h)) / (2*h));
  
endfunction
