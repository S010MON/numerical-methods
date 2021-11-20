% CS5810  -- Programming for data analysis 
% 
%  Assignment 2 | Prof. Alberto Paccanaro
% 
function output = wordscount(n)

	% Open the file and read in all of the words
	file_id = fopen('TheTortoiseAndTheHare.txt');
	C = textscan(file_id, '%s');
	fclose(file_id);

	% Remove nesting from cell array
	C = C{1};

	% Set every word to lower case for counting purposes
	C_lower = lower(C);

	% find the unique elements in the input
	unique_words = unique(C_lower)';

	% use string comparison ignoring the case
	occurrences = strcmpi(C_lower(:,ones(1,length(unique_words))),unique_words(ones(length(C_lower),1),:));

	% count the occurences
	counts = sum(occurrences,1);
	
	% Merge the two data sets together
	unsorted = {};
	for i = 1:length(counts)
		unsorted = [unsorted; {counts(i), unique_words{i}}];
	end %for

	% Sort the data by the first column (count)
	sorted = sortrows(unsorted, 1);
	
	% Pretty print to the terminal
	for i = 1:length(sorted)
		formatSpec = '%s: %d';
		A1 = sorted{i,2};
		A2 = sorted{i,1};
		disp(sprintf(formatSpec,A1,A2));
	end %for

	% Select the n lowest counts
	n_lowest = {};
	for i = 1:n
		n_lowest = [n_lowest; {sorted{i,1}, sorted{i,2}}];
	end %for
	
	% Select the n highest counts
	n_highest = {};
	for i = length(sorted):-1:(length(sorted)-n+1)
		n_highest = [n_highest; {sorted{i,1}, sorted{i,2}}];
	end %for

	output = {n_highest; n_lowest};
end %function
