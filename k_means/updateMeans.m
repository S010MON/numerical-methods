function [centroids, data] = updateLabels(centroids, data)

	for i = 1:length(data)
		min_dist = 1000000;
		min_label = 0;
		x_1 = data(i,1);
		y_1 = data(i,2);

		for j = 1:length(centroids)
			x_2 = centroids(j,1);
			y_2 = centroids(j,2);
			d = dist(x_1, y_1, x_2, y_2);
			if d < min_dist
				min_dist = d;
				min_label = j;
			end%if
		end%for

		data(i,3) = min_label;
	end%for
end%function
