function labels = updateLabels(centroids, data, labels)

	for i = 1:length(data)
		min_dist = 1000000;
		min_label = 0;
		A = data(i,:);

		for j = 1:length(centroids)
			B = centroids(j,:);
			d = dist(A, B);
			if d < min_dist
				min_dist = d;
				min_label = j;
			end%if
		end%for

		labels(i) = min_label;
	end%for
end%function
