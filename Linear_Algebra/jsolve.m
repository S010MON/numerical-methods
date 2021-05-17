function x = jsolve (A, b, tol)
    
    sizeA = size(A);
    x =  zeros(sizeA(1),1);
    
    for n = 1:tol    % number of iterations
        t =  x;
        for i = 1: sizeA(2);                             % For every row in A                                              
              t(i) = b(i);
              for j = 1:sizeA(1)                         % For every col in A
                  if( i != j)
                        t(i) = t(i) - ( A(i,j)*t(j) );
                  endif
              endfor
              t(i) = t(i)/A(i,i);
        endfor
        x = t;
    endfor
endfunction
