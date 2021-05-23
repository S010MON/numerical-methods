
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
