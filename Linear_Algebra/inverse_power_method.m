
function x = inverse_power_method (A, x, mu, n)
% INVERSE POWER METHOD
% Finds the eigen vector of A closest to mu for n iterations of the power method where:
% A =  an nxn matrix
% mu = a target value
% n = the number of itertations to be made of the power method
% Returns x: an array of eigenvectors 

    sizeA = size(A);
   
    I = eye(sizeA(1));                  % Set up (A - I*mu)^-1
    mu = I * mu;
    A = (A - mu)^-1;

    for i = 1:n;
        y = A*x
        x = y./largest(y)
    endfor
endfunction
