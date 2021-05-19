
function x = solve_matrix (A, b)
 % SOLVES by LU decomposition where:
 % A - an nxn matrix
 % x - a R^n vector
 % RETURNS: b -- a R^n vector solution
  L = lower_triangular(A);
  x =  forward_substitution(L, b);
  U = upper_triangular(A);
  x = backward_substitution(U, x)
  
endfunction
