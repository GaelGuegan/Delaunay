function plot_circle(center,radius)
% Plot circle on current figure
% =========================================================================
% INPUTS :
%   center : circle center - < 1 x 2 > real
%   radius : circle radius - < 1 x 2 > real
% =========================================================================

theta = 0:pi/50:2*pi;
x = radius * cos(theta) + center(:,1);
y = radius * sin(theta) + center(:,2);

plot(x, y , '--k');

end