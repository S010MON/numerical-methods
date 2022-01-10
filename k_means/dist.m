function d = dist(A, B)
%% Take in two points A and B where A and B are arrays and each element i
%% in the arrays indicates the i^th dimension 
	 
	sigma = 0;
	for i = 1:length(A)
		sigma = sigma + (A(i) - B(i))^2;
	end

	d = sqrt(sigma);
	
endfunction
