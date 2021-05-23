
function x = power_method (A, x, n)
% POWER METHOD for finding Eigenvectors
% Finds the eigen vector of A for n iterations of the power method where:
% A =  an nxn matrix
% n = the number of itertations to be made of the power method
% return: x the final eigenvector

    for i = 1:n;
        x = A*x;               
        x = x./sup_norm(x);
    endfor
endfunction
