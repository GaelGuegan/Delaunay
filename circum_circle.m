function [center, radius] = circum_circle( point_A, point_B, point_C )
% Compute center of circum circle using wikipedia formula
% =========================================================================
% INPUTS 
%   point_A : 1st point - < 1 x 2 > real
%   point_B : 2nd point - < 1 x 2 > real
%   point_C : 3rd point - < 1 x 2 > real
% OUTPUTS 
%   radius : circumcircle radius - < 1 x 2 > real
%   center : circumcircle center - < 1 x 2 > real
% =========================================================================

% transposing system to place point_C at the origin
a = point_A - point_C;
b = point_B - point_C;

if length(point_A)==3
    
    cross_ab = cross(a,b);
    
    % compute circum radius
    radius = norm(a)*norm(b)*norm(a-b)/(2*norm(cross_ab));
    
    % compute circum center
    center = cross((norm(a)^2*b-norm(b)^2*a),cross_ab)/(2*norm(cross_ab)^2)+point_C;
    
elseif length(point_A)==2
    
    % transposing system to place point_A at the origin
    B = point_B - point_A;
    C = point_C - point_A;
    
    % compute circum center
    D = 2*(B(1)*C(2)-B(2)*C(1));
    center(1) = (C(2)*(norm(B)^2)-B(2)*(norm(C)^2))/D;
    center(2) = (B(1)*(norm(C)^2)-C(1)*(norm(B)^2))/D;
    
    % compute circum radius
    radius = norm(center);
    
    center = center + point_A;
    
else
    error('dimension != 2 ou 3');
end

end

