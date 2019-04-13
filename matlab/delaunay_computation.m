function graph = delaunay_computation(points, i, j)
% Recursive Delaunay function
% =========================================================================
% INPUTS :
%   i : point at index i - < 1 > integer
%   j : point at index j - < 1 > integer
% OUTPUTS :
%   graph : table of connectivity of points - < N x 2 > integer
% =========================================================================

if size(points,1) == 2 % 2 points 
    % create a segment
    graph(1,:) = [i, j];
elseif size(points,1) == 3 % 3 points
    % create 3 segments
    graph(1,:) = [i, i+1];
    graph(2,:) = [i+1, j];
    graph(3,:) = [j, i];
else % 2 halves delaunay computation and merge
    m = floor((i+j)/2);
    graph_L = delaunay_computation(points(i:m,:), i, m);
    graph_R = delaunay_computation(points(m+1:j,:), m+1, j);
    
    subplot(1,2,1)
    plot_graph( points, graph_L, 'red' );
    plot_graph( points, graph_R, 'blue' );
    
    graph = merge_halves(points, graph_L, graph_R);
    
    
end

end
