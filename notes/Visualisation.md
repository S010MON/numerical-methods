
## Visualisation


### 2D Plotting
	plot(x,y)		Plots a set X against set Y

	plot(x,f(x))		Plot a set X against f(x)

	plot(x,y,'mod')		modifiers (colours: b, g, r, c, m, y) (Symbols: - , *, - -, -. , >, <, ^, p, h, :)

### Multiple data sets:
	hold on			% Turn on the hold at the start
	%insert plots
	hold off		% Plot the graphs

### Labels

	title('Title')
	
	ylabel('Label')
	
	xlabel(Label')

	legend('one','two')

	grid on

	axis square

### Plot Management

	figure(n)		% open a new figue labled "Figure n"

	close			% close current figure

	close all		% close all figures

	clf			% clear a figure without closing

### Saving Plots

	cd ~/directory/where/you/want/to/save

	print -dpng 'Name.png'

### Subplot()

	subplot(h, w, box)	% Divide into h x w no. of boxes and select a box 
	subplot(1, 2, 1)	% Divides plot into 1 x 2 grid and accesses the first box
	scatter
	bar
	loglog
	semilogx
	semilogy

### 3D Plotting
	plot3(x,y,z)

	In surface plotting, the first data structure you must create is called a mesh, a listing of all combinations of X and y
	This is done as two matrices X and Y where X = (i,j) and Y = (i,j).  A thrid mesh can be created using the meshgrid() function.
	
	[X,Y] = meshgrid(x,y)	% where x and y are pre-defined arrays
	
	Z = f(X).*f(y);		% create Z values
	
	surf(X,Y,Z)		% surface the plot

### Histograms

	hist(M) 		% Where m is a matrix: prints out a Histogram graph

			|               __
			|	     __|  |
			|         __|  |  |__
			|      __|  |  |  |  |__
			|   __|  |  |  |  |  |  |__
			|__|__|__|__|__|__|__|__|__|__

	hist(M, columns)  	% will set the number of columns

### Visualising Matrices

	imagesc(M)		% plots the matrix M in coloured boxes for visualisation

	colorbar		% adds a colour bar to the visualisation

	colormap grey		%  sets the colouring
