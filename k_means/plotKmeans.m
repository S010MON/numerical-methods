function out = plotKmeans(centroids, data, labels)

	scatter(centroids(:,1), centroids(:,2), "k", "filled");
	hold on
	for i = 1:length(data)
		if labels(i) == 1
			scatter(data(i,1), data(i,2), "r")
		elseif labels(i) == 2
			scatter(data(i,1), data(i,2), "g")
		elseif labels(i) == 3
			scatter(data(i,1), data(i,2), "b")
		end%if
	end%for
	hold off

end%function
