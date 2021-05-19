
function y = forward_substitution (L, b)
 % FORWARD SUBSTITUTION of a lower triangular matrix to solve
 % Ly = b where:
 % L - a lower triangular nxn matrix
 % b - a R^n vector
 % RETURNS: y - a R^n vector solution
 
    n = length(L);
    y = [1 : n];
    y = y';
    
    for row = 1 : n
      
          for col = 1 : n
            
                if col < row
                  b(row) = b(row) - (y(col) * L(row,col) ); 
                endif
            
          endfor
          y(row) = b(row);
    endfor
  
endfunction
