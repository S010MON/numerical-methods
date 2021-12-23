function out = plotKmeans(centroids, data)

	scatter(centroids(:,1), centroids(:,2), "k", "filled");
	hold on
	for i = 1:length(data)
		if data(i,3) == 1
			scatter(data(i,1), data(i,2), "r")
		end%if
		if data(i,3) == 2
			scatter(data(i,1), data(i,2), "g")
		end%if
		if data(i,3) == 3
			scatter(data(i,1), data(i,2), "b")
		end%if
	end%for
	hold off

end%function
