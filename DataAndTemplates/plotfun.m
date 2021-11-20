% CS5810  -- Programming for data analysis 
% 
%  Assignment 2 | Prof. Alberto Paccanaro
%
function output = plotfun(V)
	
	% prompt user for input function
	prompt = 'Enter the mathematical expression: ';
	input_string = input(prompt, 's');

	% Concatonate 'f = @(x)' to the front of the input string
	funct_string = strcat('f = @(x)', input_string);

	% make function into an executeable function
	eval(funct_string)

	% calculate the number k for k x 2 plots
	k = ceil(length(V)/2)

	% for every entry in the vector 'V' plot a new function graph
	for i = 1:length(V)

		% Set the size of the step and calculate X and Y values	
		step = 10/V(i);
		X = [0:step:10];
		Y = f(X);

		% Plot the graph in the ith position
		subplot(k, 2, i)  
		scatter(X, Y, 'r', 'filled');
		plot_title = strcat('Number of points = ', int2str(V(i)));
		title(plot_title);
	end %for

end %function
