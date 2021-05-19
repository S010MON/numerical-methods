
function U = upper_triangular (A)
 % UPPER TRANGULAR decomposition by gaussian eliminatuon where:
 % A - an nxn matrix
 % RETURNS: U - an upper triangular matrix in the form:
 %
 %      2 1 3           2 1 3
 %      4 4 7   ->    0 2 1
 %      1 5 9           0 0 4
 %
 % where each value is a coeficient to be applied to make a upper triangular matrix 
  n = length(A);
  U = zeros(n);
  
  for  col = 1 : n                                                       % Work down the diagonal
      diagonalValue = A(col, col);
      for row = 1 : n                                                   % Work down each col under diagonal           
         
         if row > col                                                     % If the value is in the lower  half
             currentValue = A(row, col);
             L(row, col)  = currentValue/diagonalValue;
             A(row, 1:end) = ( A(row, 1:end) - (A(col,1:end) * L(row,col)) );
         endif
          
      endfor
      
  endfor

  U = A;
  
endfunction
