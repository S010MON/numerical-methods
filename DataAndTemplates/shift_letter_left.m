function output = shift_letter_left(letter, L)

	vocab = 'abcdefghijklmnopqrstuvwxyz';
	indx = 0;

	% find letter in alphabet
	for i = 1:length(vocab)
		if (letter == vocab(i))
			indx = i;
		end %if
	end %for
	
	% if the index is to be shifted more than 26, wrap round to 0 again
	new_index = indx - L;
	if (new_index <= 0)
		% go to the last index in vocab and count down from the top
		new_index = length(vocab) + new_index;  
	end %if

	output = vocab(new_index);
