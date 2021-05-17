clc;
clear;

A = [ [ 2,-1, 1];
         [ 4, 7, 3];
         [ 3, 1, 6];];

   
b = [ 2;-1; 3];

x =  [0; 0; 0];

for n = 1:2    % number of iterations
    
    for i = 1:length(A)                             % For every row in A                                              
          x(i) = b(i);
          for j = 1:length(A)                        % For every col in A
              if( i != j)
                    x(i) = x(i) - ( A(i,j)*x(j) );
              endif
          endfor
          x(i) = x(i)/A(i,i);
    endfor
    printf("Iteration: ");
    n
    x
endfor