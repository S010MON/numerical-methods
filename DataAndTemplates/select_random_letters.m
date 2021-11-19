function output = select_random_letters(L)

	vocab = 'abcdefghijklmnopqrstuvwxyz';

	output = '';

	for i = 1:L
		n = size(vocab);
		r = randi(n);
		output(end+1) = vocab(r);
	end %for
end %function
