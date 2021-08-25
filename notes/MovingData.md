### Moving Data Around

#### Commands for navigating and managing workspace

	pwd 				% Print the working directory
	cd [dir_name]			% Change directory to a named file
	cd [path]			% Change directory to a path location
	cd ..				% Move up one level

	load [file_name]		% Load the named file
	load('file_name')		% Alternate method of loading strings

	save [file_name] [variable]	% saves variable as the named file 
	save [myMatrix.m] [M]		% use .m | .dat | .txt -ascii for different outputs

	who				% Shows the variables visible in current scope
	whos				% Shows the variables with more specifics

	clear				% clears all variables from scope
	clear [variable]		% removes the variable from the scope


#### Manipulating Data

For a dataset where M is a 5X5 array:

	M =  
		1   2   3   4   5
		1   2   3   4   5
		1   2   3   4   5
		1   2   3   4   5 
		1   2   3   4   5

	e = M(2,3)			% Select a single element e from M
	e = 3

	v = M(2,:)			% Selects the entire row
	v = 1  2  3  4  5		
	
	u = M(:,2)			% Selects the entire column
	u = 	
		2
		2
		2
		2
		2
	
	A = M(:, [1,3]			% Select everything from the 1st and 3rd column of M
	A =
		1  3
		1  3
		1  3
		1  3
		1  3

	A(:,2) = [7, 7, 7, 7, 7]'	% Replaces the column vector of 3's with 7's

	A = 
		1  7
		1  7
		1  7
		1  7
		1  7
