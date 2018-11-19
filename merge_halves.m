function graph = merge_halves(points, graph_L, graph_R)
% Compute which vertex to add for merging 2 graphs
% =========================================================================
% INPUTS
%   points  : list of points to connect - < N x 3 > real
%   graph_L : table of connectivity of left points - < N x 2 > integer
%   graph_R : table of connectivity of right points - < N x 2 > integer
% OUTPUTS
%   graph   : table of connectivity of points - < N x 2 > integer
% =========================================================================

m = max(graph_L);
points_L = points(1:m,:);
points_R = points(m+1:end,:);

%% initialize base
base_L = points_L(points_L(:,2) == min(points_L(:,2)),:);
base_R = points_R(points_R(:,2) == min(points_R(:,2)),:);

graph = [];

critereArret = 1;
while (critereArret)
    
    graph(size(graph,1)+1,:) = [base_R(3) base_L(3)];
    
    plot([base_R(1) base_L(1)],[base_R(2) base_L(2)],'-k');
    
    [ candidat_R, graph_R, center_R, radius_R ] = candidat_graph_R( points_R, base_R, base_L, graph_R );
    [ candidat_L, graph_L, center_L, radius_L ] = candidat_graph_L( points_L, base_R, base_L, graph_L );
    
    % look which one is valid between candidat_L and candidat_R
    if isempty(candidat_R) && isempty(candidat_L)
        critereArret = 0;
        base = [];
    elseif (isempty(candidat_R) && ~isempty(candidat_L))
        base = [candidat_L(3) base_R(3)];
    elseif (isempty(candidat_L) && ~isempty(candidat_R))
        base = [base_L(3) candidat_R(3)];
    elseif norm(candidat_R(1:2)-center_L) > radius_L
        base = [candidat_L(3) base_R(3)];
    elseif norm(candidat_L(1:2)-center_R) > radius_R
        base = [base_L(3) candidat_R(3)];
    else
        error('ici');
    end
    
    if ~isempty(base)
        base_L = points(base(1),:);
        base_R = points(base(2),:);
    end
    
end

graph(size(graph,1)+1:size(graph,1)+size(graph_L,1),:) = graph_L;
graph(size(graph,1)+1:size(graph,1)+size(graph_R,1),:) = graph_R;

end