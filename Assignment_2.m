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
        x0 = X(row) 			
        x1 = X(row+n)
        fx0 = A(row,col-1) 
        fx1 = A(row+1,col-1)
        A(row,col) = (fx1 - fx0)/(x1 - x0);
      end%for
    n = n+1;
  end%for
  A                                %unsuppress for printout
  A = A(1,:);
end%function

% ************************************************************************ %
function [y] = recursiveNestedForm(A, X, x0, index)
%INTERPOLATE the approximate value of f(x0) recursively
%	param: A = set of coeficients
%	param: X = set of X values
%	param: index = the current index of the recursion
% param: x0 = the value to be evaluated
%	return: y = the approximate value of the function at x0

	if index == 1
    y = A(1);
	else
    nf = nestedForm(A, X, x0, (index-1));
    xk = X(index-1);
    ak = A(index);
    y = nf + ((x0 - xk) * ak);
	end%if
end%function

% ************************************************************************ %
function [y] = recursiveNestedForm(A, X, x0, index)
%INTERPOLATE the approximate value of f(x0) recursively
%	param: A = set of coeficients
%	param: X = set of X values
%	param: index = the current index of the recursion
% param: x0 = the value to be evaluated
%	return: y = the approximate value of the function at x0

	if index == 1
    y = A(1);
	else
    nf = nestedForm(A, X, x0, (index-1));
    xk = X(index-1);
    ak = A(index);
    y = nf + ((x0 - xk) * ak);
	end%if
end%function

% ************************************************************************ %
function [y] = standardNestedForm(A, X, x0)
%INTERPOLATE the approximate value of f(x0) 
%	param: A = set of coeficients
%	param: X = set of X values
% param: x0 = the value to be evaluated
%	return: y = the approximate value of the function at x0
  
    total = A(1);
    for i = 1: (length(A) -1)
        t = 1;
        for j = 1 : i
            t = t * (x0 - X(j));
        end%for
        t = t * A(i +1);
        total = rnd(total + t, 3);
    end%for
    y = rnd(total, 3);
end%function

% ************************************************************************ %

xValues = [2.5, 2.0, 3.0, 1.5, 3.5, 1.0, 4.0, 0.5, 4.5, 0.0, 5.0];
yValuesAct = [0.68, 0.66, 0.90, 0.79, 1.31, 1.02, 1.77, 1.30, 1.87, 1.50, 1.33];
yValuesApx = [0.70, 0.74, 0.94, 0.79, 1.34, 1.05, 1.78, 1.33, 1.87, 1.49,1];
degree = 10; 

aAct = divided_difference_table(xValues, yValuesAct);  
fAct = @(x) standardNestedForm(aAct, xValues, x);
pAct = @(x) polyval(polyfit(xValues, yValuesAct, degree),x);

aApx = divided_difference_table(xValues, yValuesApx);
fApx = @(x) standardNestedForm(aApx, xValues, x);
pApx = @(x) polyval(polyfit(xValues, yValuesApx, degree),x);

fplot(pAct, [-0.1, 5.1]);
hold on; 
fplot(pApx, [-0.1, 5.1]);
fplot(fAct, [-0.1, 5.1]); 
hold off;

y = standardNestedForm(aAct, xValues, 2.5);
y = standardNestedForm(aApx, xValues, 2.5);