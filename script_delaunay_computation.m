clear
clc
clf;

% our set of points
points(:,1) = randi(100,5,1); % x
points(:,2) = randi(100,5,1); % y
% sort by x coordinates
points = sortrows(points,1);
for i = 1:size(points,1)
    points(i,3) = i;
end
plot_graph(points);

% call recursive delaunay_computation function
graph = delaunay_computation(points, 1, size(points,1));
 
subplot(1,2,2)
plot_graph( points, graph, 'black' );

