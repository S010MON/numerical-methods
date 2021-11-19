% CS5810  -- Programming for data analysis 
%
%  Assignment 2 | Prof. Alberto Paccanaro
% 
function output = decrypt(e, L, message)

	% part 1: remove 'L' random chars from between each pair of letters
	if (e == 1)
		output = '';

		% for every index 'i' in the message
		for i = 1:length(message)

			% if the modulus of i/L returns 1 
			if (mod(i,L+1) == 1)

				% add the string to the output
				output = strcat(output, message(i));
			end %if
		end %for

	% part 2: shift each letter 'L' places left in the alphabet
	else if (e == 2)
		output = '';

		% for every char 'c' in the message
		for c = message
			% select a new letter using the shift_letter_left function
			new_letter = shift_letter_left(c, L);

			% add this letter to the end of the output string
			output = strcat(output, new_letter);
		end %for
	end %if
end %function
