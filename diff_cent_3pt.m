
function fprime = diff_cent_3pt (f, x, h)
# Finds the derivative using the three point centered difference formula where:
  
  fprime = ((f(x+h) - f(x-h)) / (2*h));
  
endfunction
