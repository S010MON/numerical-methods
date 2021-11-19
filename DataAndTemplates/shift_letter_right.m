function output = shift_letter_right(letter, L)

	vocab = 'abcdefghijklmnopqrstuvwxyz';
	indx = 0;

	% find letter in alphabet
	for i = 1:length(vocab)
		if (letter == vocab(i))
			indx = i;
		end %if
	end %for

	
	% if the index is to be shifted more than 26, wrap round to 0 again
	new_index = indx + L;
	if (new_index > length(vocab))
		% use the remainder after diving by the vocab size
		new_index = mod(new_index, length(vocab));  
	end %if

	output = vocab(new_index);
