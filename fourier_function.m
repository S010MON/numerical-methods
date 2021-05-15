
function f = fourier_function (c, n)
% Creates an approxiamte fourier function from
% c - the array of coeficients in the form a0, a1, b1, a2, b2, ... an, bn    
% n - the degree of the fourier series where:  n <= length c/2 -1    
    
    f = @(x) c(1)
    for i = 2: n
      f = @(x) (f(x) + (c(i).*cos((i-1).*x)) + (c(i+1).*sin((i-1).*x)))
    end%for
end%function
