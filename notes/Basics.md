### Operators
	
#### Basic Maths
	+	add			
	-	subtract
	*	multipy
	/	divide			
	ˆ	power			
	()	function
	>	greater			
	>	>=	greater or eq		
	>	==	equal
	<	smaller			
	<=	smaller or eq		
	∼=	not equal	

####  Boolean
	&&	AND			
	||	OR (not XOR)		
	∼	NOT

####  Adv Maths
	
	i				
	factorial()			
	rem()	// the remainder
	pi				
	sin()				
	cos()
	exp()			
	log()				
	log10()
	
####  MATLAB Specific
	
	clear x				get rid of variable x
	clear / clear all		get rid of all variables
	clc				clear screen
	ans				default answer variable
	help functionName()		provide help for specified function 
	NaN				not a number (i.e. 0/0)
	Inf				infinity
	
#### Changing Display Format
	
	format short		
	format long			
	format bank
	
	% This does not change the number


### Variables, Arrays & Matrices

#### Variables
	x = 1;			Double (as standard)

	c = 'char'		Chars (incl Strings)

	class(x);		get what type of variable 

	
#### Array
	X1 = [1, 2, 3];
	x2 = [4, 5, 6];

#### Matrices
	M = [1, 2, 3; 4, 5, 6];

	-OR-

	M = [[1, 2, 3];[4, 5, 6]];
	
	-OR-

	M = [X1; X2];

	-OR-

	M = [[1; 4],[2; 5],[3; 6]];

#### Indexing

	To access row r in column c of array A:   A(r,c)

	To access a range use the ':' operator:   A(r, c1:c4)	-OR-	A(r1:r2, c)

	To access from a mid point to the end:	  A(r, c:end)

### Struct Arrays

Like a class in Java can hold multiple data types within a data structure:

	student(1).name = 'john';
	student(1).ID	= 1234567;
	student(1).grades = [9.5  7  8  8.5]
	
### Recursion

	See Recursion section
	

