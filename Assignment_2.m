clc;
clear;
format short;

% ************************************************************************ %
function [A] = divided_difference_table(X, Y)
%DIVIDED DIFFERENCES TABLE of a from values x0 and x1

  A = zeros(length(Y), length(Y));
  A(:,1) = Y;
  n = 1;
  for col = 2:length(A)
      
      for row = 1: length(Y)-n
        x0 = X(row); 			
        x1 = X(row+n);
        fx0 = Y(row); 
        fx1 = Y(row+n);
        A(row,col) = (fx1 - fx0)/(x1 - x0);
      end%for
      
    n = n+1;
  end%for
  A = A(1,:);
end%function

% ************************************************************************ %
function [y] = interpolate(A, X, x0, index)
%INTERPOLATE the approximate value of f(x0) recursively
%	param: A = set of coeficients
%	param: X = set of X values
%	param: index = the current index of the recursion
% param: x0 = the value to be evaluated
%	return: y = the approximate value of the function at x0

	if index <= 1
		y = A(index) + (X(index) - x0); 
	else
		y = interpolate(A, X, x0, index-1);
		y = (y * A(index)) + ( X(index) - x0);
	end%if
end%function

% ************************************************************************ %
xValues = [2.5, 2.0, 3.0, 1.5, 3.5, 1.0, 4.0, 0.5, 4.5, 0.0, 5.0];
yValuesAct = [0.68, 0.66, 0.90, 0.79, 1.31, 1.02, 1.77, 1.30, 1.87, 1.50, 1.33];
yValuesApx = [0.70, 0.74, 0.94, 0.79, 1.34, 1.05, 1.78, 1.33, 1.87, 1.49,1];
degree = 10; 

A = divided_difference_table(xValues, yValuesAct)

cs = polyfit(xValues, yValuesAct, degree)

g = @(x) polyval(A,x)
p = @(x) polyval(cs,x);
hold on;
fplot(p, [-0.1, 5.9]);
fplot(g, [-0.1, 5.9]);
hold off;
