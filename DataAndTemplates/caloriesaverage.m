% CS5810  -- Programming for data analysis 
%
%  Assignment 2 | Prof. Alberto Paccanaro
% 
function ave_calories = caloriesaverage(cal)

	% We define these as 'persistent' so that the values remain after the function
	% call has been completed and returned
	persistent total;
	persistent count;

	% Case 1: the variable is 0 (or smaller) so we reset everything and return 0
	if (cal <= 0)
		total = 0;
		count = 0;
		ave_calories = 0;
	
	% Case 2: we recive our first input, so we create our variables
	else if isempty(count)
		count = 1;
		total = cal;
		ave_calories = total / count;
		
	% Case 3: anything else, we add to the total and divide by (count + 1)
	else
		total = total + cal;
		count = count + 1;
		ave_calories = total / count;
	end 
end	
