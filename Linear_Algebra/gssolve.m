function x = gssolve (A, b, tol)
    
    sizeA = size(A);
    x =  zeros(sizeA(1),1);
    
    for n = 1:tol                                         % number of iterations    
        for i = 1:sizeA(2)                             % For every row in A                                              
              x(i) = b(i);
              for j = 1:sizeA(1)                        % For every col in A
                  if( i != j)
                        x(i) = x(i) - ( A(i,j)*x(j) );
                  endif
              endfor
              x(i) = x(i)/A(i,i);
        endfor
    endfor
endfunction
