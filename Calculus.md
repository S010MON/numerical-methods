### Defining simple algebraic functions

	for f(x) = x^2 + 1
	
	f= @(x) x^2+1;

### Evaluating Polynomials

	p = [3 2 1];		% Create a vector holding the degree of each polynomial
	x = [5 7 9];		% Create a coeficient for each x value 
	y = polyval(p,x)	% Set y = 5x^3 + 7x^2 + 9x  (in this case)
	
