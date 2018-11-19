function [ candidat, graph, center, radius ] = candidat_graph_R( points, base_R, base_L, graph )

for i = 1:size(points,1)
    % compute circum circle
    [center, radius] = circum_circle( points(i,1:2), base_R(1:2), base_L(1:2) );
         
    % compute angle
    angle = angle360(points(i,1:2), base_R(1:2), base_L(1:2));

    % different cases to treat
    candidat = [];
    if angle > 180 || isequal(points(i,:),base_R) || isequal(points(i,:),base_L)
        continue;
    elseif i == size(points,1) || size(graph,1) == 1 || norm(points(i+1,1:2)-center) > radius
        candidat = points(i,:);
        break;
    else
        i_remove = (graph(:,1)==points(i,3) & graph(:,2)==base_R(3)) | (graph(:,1)==base_R(3) & graph(:,2)==points(i,3));
        graph(i_remove,:) = []; % remove arete
    end
end

end

