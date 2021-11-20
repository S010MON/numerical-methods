% CS5810  -- Programming for data analysis 
% 
%  Assignment 2 | Prof. Alberto Paccanaro
% 
function output = myevalueA(err)

	% Set the value for 'n' in our formula to 1
	n = 1;

	% Set the first estimate to a stupidly hight number
	e_hat = 100000;

	% Calculate the error 'epsilon' between the estimate and the actual value 
	epsilon = abs(exp(1) - e_hat);

	% While the error is greater than the inputted 'err' value
	while epsilon > err

		% Use the given formula to find the inverse
		e_inverse = (1 - (1/n))^n;

		% Invert to get an estimated value for e
		e_hat = 1/e_inverse;

		% recaluculate the new error (for the while loop to test)
		epsilon = abs(exp(1) - e_hat);

		% increment the counter
		n = n+1;
	end %while

	output = [e_hat, n, epsilon];
end %function
