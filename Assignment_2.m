clc;
clear;
format short;

% ************************************************************************ %
function [y] = divided_difference(fx0, fx1, x0, x1)
%CALCULATE DIVIDED DIFFERENCE of a function f from values x0 and x1

	y = (fx1 - fx0)/(x1 - x0);
end%function


% ************************************************************************ %
function [as] = interpolate(X, Y, n)
%INTERPOLATE a function f to degree d from values X and Y where:
%	X = set of x values x0 - xn
%	Y = set of y values y0 - yn
%	n = the degree to evaluate to
%	return as = the coeficients of the newton nested form
	

	col = n+1;
	row = n;

	A = zeros(row,col);		% Build a matrix for A and copy X and Y into it
	for r = 1:row
		A(r,1) = X(r);
		A(r,2) = Y(r);
	end%for
		
	stopPntr = row - 1;
	for c = 3:col
		for r = 1:stopPntr
			x0 = A(r,c-2); 			
			x1 = A(r+1, c-2);
			fx0 = A(r, c-1); 
			fx1 = A(r+1, c-1);
			A(r,c) = divided_difference(fx0, fx1, x0, x1);	
		end%for
	stopPntr = stopPntr - 1;
	end%for
				A%remove after testing
	as = 1:col;
	for c = 1:col
		as(c) = A(1,c);
	end%for
end%function


% ************************************************************************ %
x = [2.5, 2.0, 3.0, 1.5, 3.5, 1.0, 4.0, 0.5, 4.5, 0.0, 5.0];
yAct = [0.68, 0.66, 0.90, 0.79, 1.31, 1.02, 1.77, 1.30, 1.87, 1.50, 1.33];
yApx = [0.70, 0.74, 0.94, 0.79, 1.34, 1.05, 1.78, 1.33, 1.87, 1.49,1];
n = 11;

interpolate(x,yAct,n)

cs = polyfit(x, yAct, n);
polyval(cs,x);
 
