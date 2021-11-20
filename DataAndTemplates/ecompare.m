% CS5810  -- Programming for data analysis 
%
%  Assignment 2 | Prof. Alberto Paccanaro
%
function output = ecompare(X)
	
	Y_error_a = zeros(size(X));
       	Y_iter_a  = zeros(size(X));
       	Y_error_b = zeros(size(X));
	Y_iter_b  = zeros(size(X));

	for i = 1:length(X)
		Y_a = myevalueA(X(i));
		Y_error_a(i) = Y_a(1);
		Y_iter_a(i) = Y_a(2);

		Y_b = myevalueB(X(i));
		Y_error_b(i) = Y_b(1);
		Y_iter_b(i) = Y_b(2);
	end %for

	output = [X; Y_error_a; Y_error_b];
	scatter(X, Y_error_a, 'filled')
	hold on
	scatter(X, Y_iter

end %function
