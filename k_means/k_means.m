
%% generate three random clusters
clusters = 3;
data_points = 1000; % n.b.  we select out so there will be fewer than this number
data = generateData(dims, clusters, data_points);
S = size(data);
dims = S(2);

%% Add labels to the data as a third column
labels = zeros([length(data),1]);

%% generate k random centroids within the max sizes of the data
k = 3;
m = max(max(data));
centroids = rand([k,dims]) .* m;

%% Label the data
labels = updateLabels(centroids, data, labels);

%% Plot the data and the centroids
figure(1)
plotKmeans(centroids, data, labels);

%% Run n iterations of the algorithm
for i = 1:100
	
	% re-label the data
	labels = updateLabels(centroids, data, labels);
	% update the centroid location to the mean of the current data 
	centroids = updateMeans(centroids, data, labels);
	
end %for

%% Plot the end result
figure(2)
plotKmeans(centroids, data, labels);
