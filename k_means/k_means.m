
%% generate three random clusters
c1 = rand([100,2]);
c2 = rand([100,2]) .+ [0.6,3];
c3 = rand([100,2]) .+ [1.3,0];

%% Concatonate the three clusters into one dataset
data = [c1; c2; c3];

%% Add labels to the data as a third column
data = [data, zeros([length(data),1])];

%% generate k random centroids within the max sizes of the data
max_x = max(data(:,1));
max_y = max(data(:,2));

k = 3;
centroids = rand([k,2]) .* [max_x/2, max_y];

%% Label the data
R = updateLabels(centroids, data);
data = R{2};

%% Plot the data and the centroids
figure(1)
plotKmeans(centroids, data);

%% Run n iterations of the algorithm
for i = 1:100
	
	% re-label the data
	R = updateLabels(centroids, data);
	data = R{2};
	% update the centroid location to the mean of the current data 
	centroids = updateMeans(centroids, data);
	
end %for

%% Plot the end result
figure(2)
plotKmeans(centroids, data);
