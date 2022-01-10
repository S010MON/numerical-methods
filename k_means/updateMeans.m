function centroids = updateMeans(centroids, data, labels)
%% Set each centroid to the mean x and y position of the data points 
%% that are closest to it
	
	for i = 1:length(centroids)
		sigma = zeros(size(centroids));
		count = 0;
		for j = 1:length(data)

			% if the data is labelled i
			if labels(j) == i
				sigma(i,:)  = sigma(i,:) + data(j,:);
				count = count + 1;
			end%if
		end%for

		% Reassign centroid to the mean average of positions
		centroids(i,:) = sigma(i,:) ./ count
	end%for
end%function
