
function x = power_method (A, x, n)
% POWER METHOD for finding Eigenvectors
% Finds the eigen vector of A for n iterations of the power method where:
% A =  an nxn matrix
% n = the number of itertations to be made of the power method
% return: lambda the final eigenvector

    sizeA = size(A);
    for i = 2:n;
        y = A*x;               
        x = y./largest(y);
    endfor
endfunction
