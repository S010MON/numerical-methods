
%% generate three random clusters
c1 = rand([100,2]);
c2 = rand([100,2]) .+ [0.5,1.5];
c3 = rand([100,2]) .+ [1.5,0.5];

%% Concatonate the three clusters into one dataset
data = [c1; c2; c3];

%% Add labels to the data as a third column
data = [data, zeros([length(data),1])];

%% generate k random centroids within the max sizes of the data
max_x = max(data(:,1));
max_y = max(data(:,2));

k = 3;
centroids = rand([k,2]) .* [max_x, max_y];

%% Plot the data and the centroids
scatter(data(:,1), data(:,2));
hold on
scatter(centroids(:,1), centroids(:,2), "r");  
hold off


%% Iterate through the data and, for each element, assign the label to the closest centroid
for i = 1:length(data)
	min_dist = 1000000;
	min_label = 0;
	x_1 = data(i,1);
	y_1 = data(i,2);

	for j = 1:length(centroids)
		y_2 = centroids(j,2);
		x_2 = centroids(j,1);
		d = dist(x_1, y_1, x_2, y_2);
		if d < min_dist
			min_dist = d;
		 	min_label = j;		
		end%if
	end%for
	
	data(i,3) = min_label;
end%for

data

%% Set the colours for the scatter plot
c = [1 0 0   #red     (index 1)
     0 1 0   #green   (index 2)
     0 0 1   #blue    (index 3)
     1 1 0   #yellow  (index 4)
     1 0 1]; #magenta (index 5)

scatter(centroids(:,1), centroids(:,2), "r", "filled");  
hold on
for i = 1:length(data)
	if data(i,3) == 1
		scatter(data(i,1), data(i,2), "r")
	end
	if data(i,3) == 2
		scatter(data(i,1), data(i,2), "g")
	end
	if data(i,3) == 3
		scatter(data(i,1), data(i,2), "b")
	end%if
end%for
hold off

