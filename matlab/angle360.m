function angle = angle360( point_A, point_B, point_C ) 
% Compute angle forms by 3 points
% =========================================================================
% INPUTS 
%   point_A : 1st point - < 1 x 2 > real
%   point_B : 2nd point - < 1 x 2 > real
%   point_C : 3rd point - < 1 x 2 > real
% OUTPUTS 
%   angle : angle formed - < 1 > real
% =========================================================================

AB = point_A - point_B;
CB = point_C - point_B;

angle180 = atan2d(det([AB;CB]),dot(AB,CB));

angle = rem(360 + angle180, 360) ;

end

