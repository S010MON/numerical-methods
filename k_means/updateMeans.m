function centroids = updateMeans(centroids, data)
%% Set each centroid to the mean x and y position of the data points 
%% that are closest to it
	
	for i = 1:length(centroids)
		sum_x = 0;
		sum_y = 0;
		count = 0;
		for j = 1:length(data)

			% if the data is labelled i
			if data(j,3) == i
				sum_x += data(j,1);
				sum_y += data(j,2);
				count += 1;
			end%if
		end%for

		% find the mean average of x and y position
		centroids(i,1) = sum_x / count;
		centroids(i,2) = sum_y / count;
	end%for
end%function
