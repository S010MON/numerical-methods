clc;
clear;

%*************************************************************************************%

function d = dist (a, b)

    d = abs(sqrt((a.^2 + b.^2)));
  
endfunction

%*************************************************************************************%

function sNorm = sup_norm (vector)
    
     [v, p] = max(abs(vector));
    sNorm = v * sign(vector(p));

endfunction

%*************************************************************************************%

function mu = estimate_eigenvalue (A, lambda)

    mu = (lambda' * A * lambda) / ( lambda' * lambda);

endfunction

%*************************************************************************************%

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

%*************************************************************************************%

function [eigenValue, eigenVector] = inverse_power_method (A, x, mu, e)
% INVERSE POWER METHOD
% Finds the eigen vector of A closest to mu for an error value where:
% A     - an nxn matrix
% x     - a starting vector
% mu  - a target value
% e     - the error value
% RETRUNS: x - an array of eigenvectors 
  
    I = eye(length(A));                  % Set up (A - I*mu)^-1
    mu = I * mu;
    x0 = x;
    error = 1;
    
   while error > e
        y = ((A - mu)^-1) * x;
        x = y./sup_norm(y);
        
        error = max(A*x0) - max(A*x);
        x0 = x;   
    end%while
    
    eigenValue = max(A*x);
    eigenVector = x;
endfunction

%*************************************************************************************%

A = [ 6.25, 0.63, 0 ,0 ;
         0.63, 3.34, 0.47, 0;
         0, 0.47, 0.54, 1.00;
         0, 0, 1.00, -1.78]
I = eye(4);

for i = 1 : length(I)
    ei = I(1:end,i);      
    mu = estimate_eigenvalue(A, ei);
    [eigenValue, eigenVector] = inverse_power_method(A, ei, mu, 10e-6)
endfor
         