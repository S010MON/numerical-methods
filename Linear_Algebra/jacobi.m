clc;
clear;

A = [ [ 6, 2, 0];
         [ 3, 5,-1];
         [-2, 1, 4];];

   
b = [3; 4; 1];

x =  [0; 0; 0];

for n = 1:3    % number of iterations
    
    t =  x;
    for i = 1:length(A)                             % For every row in A                                              
          t(i) = b(i);
          for j = 1:length(A)                        % For every col in A
              if( i != j)
                    t(i) = t(i) - ( A(i,j)*t(j) );
              endif
          endfor
          t(i) = t(i)/A(i,i);
    endfor
    printf("Iteration: ");
    n
    x = t
endfor