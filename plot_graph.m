function plot_graph( points, graph, color )

plot(points(:,1),points(:,2),'.k');
hold on
for i = 1:size(points,1)
    text(points(i,1),points(i,2),num2str(points(i,3)));
end

if nargin > 1
    for i = 1:size(graph,1)
    vertex_X = [points(graph(i,1),1) points(graph(i,2),1)];
    vertex_Y = [points(graph(i,1),2) points(graph(i,2),2)];
    plot(vertex_X,vertex_Y,'Linestyle','-','Color',color);
    end
end
axis('equal')
end