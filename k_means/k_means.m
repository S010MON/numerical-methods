
c1 = rand([100,2]);
c2 = rand([100,2]) .* [0.5,1.5];
c3 = rand([100,2]) .* [1.5,0.5];

data = [c1; c2; c3];

scatter(data(:,1), data(:,2));
