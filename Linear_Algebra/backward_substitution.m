
function y = backward_substitution (U, x)
 % BACKWARD SUBSTITUTION of a lower triangular matrix to solve Ux = y where:
 % U - a lower triangular nxn matrix
 % x - a R^n vector
 % RETURNS: y - a R^n vector solution
 
    n = length(U);
    y = [1 : n];
    y = y';
    
    for row =  n : -1 : 1
      
          for col = n : -1 : 1
            
                if col > row
                  y(row) = y(row) - (x(col) * U(row,col) ); 
                endif
            
          endfor
          y(row) = x(row);
    endfor
  
endfunction
