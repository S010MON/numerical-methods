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
		Y_error_a(i) = Y_a(3);
		Y_iter_a(i) = Y_a(2);

		Y_b = myevalueB(X(i));
		Y_error_b(i) = Y_b(3);
		Y_iter_b(i) = Y_b(2);
	end %for

	hold on;
	scatter(Y_iter_a, Y_error_a, 'filled');
	scatter(Y_iter_b, Y_error_b, 'filled');
	legend('Method a','Method b','Location','northeast');
	set(gca,'xscale','log');
	set(gca,'yscale','log');
	xlabel('Iterations taken (log)');
	ylabel('Approximation error (log)');
	title('Comparison of approximation methods of e','FontSize',14);
	hold off;

	output = [Y_error_a; Y_iter_a; Y_error_b; Y_iter_b];
	

end %function
