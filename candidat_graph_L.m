function [ candidat, graph, center, radius ] = candidat_graph_L( points, base_R, base_L, graph )
% Compute angle forms by 3 points
% =========================================================================
% INPUTS 
%   points : 1st point - < 1 x 2 > real
%   base_R : 2nd point - < 1 x 2 > real
%   base_L : 3rd point - < 1 x 2 > real
%   graph 
% OUTPUTS 
%   candidat
%   graph  : 1st point - < 1 x 2 > real
%   center : 1st point - < 1 x 2 > real
%   radius : 1st point - < 1 x 2 > real
% =========================================================================


for i = size(points,1):-1:1
    % compute circum circle
    [center, radius] = circum_circle( points(i,1:2), base_R(1:2), base_L(1:2) );
    
    % compute angle
    angle = angle360(base_R(1:2), base_L(1:2), points(i,1:2));
    
    % different cases to treat
    candidat = [];
    if angle > 180 || isequal(points(i,:),base_R) || isequal(points(i,:),base_L)
        continue;
    elseif i==1 || size(graph,1) == 1 || norm(points(i-1,1:2)-center) > radius
        candidat = points(i,:);
        break;
    else
        i_remove = (graph(:,1)==points(i,3) & graph(:,2)==base_L(3)) | (graph(:,1)==base_L(3) & graph(:,2)==points(i,3));
        
        graph(i_remove,:) = []; % remove arete
    end
end

end

