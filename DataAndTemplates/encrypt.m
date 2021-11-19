% CS5810  -- Programming for data analysis 
% 
%  Assignment 2 | Prof. Alberto Paccanaro
%
function output = encrypt(e, L, message)
	
	% part 1: put 'L' random letters between each pair of letters in the message
	if (e == 1)
		output = '';
		
		% for every char 'c' in the message
		for c = message
			
			% make 'S' a random set of 'L' many letters
			% i.e. if L = 4 then:  c****   (where * is random)
			S = strcat(c, char(select_random_letters(L)));
			
			% add 'S' to the end of our output
			output = strcat(output, char(S));
		end %for

		% remove the final extra 'L' letters added
		output = output(1:end-L);

	% part 2: shift each letter 'L' letters right in the alphabet
	else if (e == 2)
		output = '';

		% for every char 'c' in the message
		for c = message
			% select a new letter using the shift_letter_right function
			new_letter = shift_letter_right(c, L);

			% add this letter to the end of the output string
			output = strcat(output, new_letter);
		end %for

	end %if
end %function
