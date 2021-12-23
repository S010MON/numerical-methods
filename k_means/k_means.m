
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

%% Add the labels to the data
R = updateLabels(centroids, data);
centroids = R{1};
data = R{2};

plotKmeans(centroids, data);


