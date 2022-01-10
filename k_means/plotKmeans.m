function out = plotKmeans(centroids, data, labels)

	% See how many dimenstions are in the data
	dims = size(data)(2);
	
	if(dims == 2)
		scatter(centroids(:,1), centroids(:,2), "k", "filled");
		hold on
		for i = 1:length(data)
			if labels(i) == 1
				scatter(data(i,1), data(i,2), "r")
			elseif labels(i) == 2
				scatter(data(i,1), data(i,2), "g")
			elseif labels(i) == 3
				scatter(data(i,1), data(i,2), "b")
			elseif labels(i) == 4
				scatter(data(i,1), data(i,2), "y")
			end%if
		end%for
		hold off

	elseif(dims == 3)
		scatter3(centroids(:,1), centroids(:,2), centroids(:,3), "k", "filled");
		hold on
		scatter3(data(:,1), data(:,2), data(:,3), 20, labels)
		hold off
	end%if

end%function
