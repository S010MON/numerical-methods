function data = generateData(dims, clusters, points)

	frame_width = 10;
	cluster_width = 2.5;
	
	data = rand([points,dims]) .* frame_width;
	cluster = rand([clusters,dims]) .* frame_width;	

	selected = [];
	for i = 1:clusters

		for j = 1:length(data)

			if((dist(data(j,:), cluster(i,:))) < cluster_width)
				selected = [selected; data(j,:)];
			end%if
		end%for
	end%for

	data = selected;
