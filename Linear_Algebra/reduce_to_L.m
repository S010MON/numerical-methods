
function L = reduce_to_L (A)

  n = length(A);
  L = zeros(n);
  
  for  col = 1 : n       % Work down the diagonal
       printf("\n");
       col
       diagonalValue = A(col, col)
      for row = 1 : n  % Work down each col under diagonal           
         
         if row > col
             currentValue = A(row, col)
             L(row, col)  = currentValue/diagonalValue;
             A(row, 1:end) = ( A(row, 1:end) - (A(col,1:end) * L(row,col)) );
         endif
          
      endfor
      
  endfor

endfunction
