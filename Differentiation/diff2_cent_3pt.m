
function fprime = diff2_cent_3pt (f, x, h)
# Finds the derivative using the three point centered difference formula where:
  
  fprime = (  (f(x-h) - (2*f(x)) + f(x+h)) / (h.^2)  );
  
endfunction