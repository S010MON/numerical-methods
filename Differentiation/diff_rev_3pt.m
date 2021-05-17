
function fprime = diff_rev_3pt (f, x, h)
# Finds the derivative using the three point centered difference formula where:
  
  fprime = (  (f(x+(2*h)) - (4 * f(x + h)) + (3* f(x))) / (2*h)  );
  
endfunction