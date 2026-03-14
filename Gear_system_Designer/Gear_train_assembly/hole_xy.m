
function [x, y] = hole_xy(A)
    theta = linspace(0, 2*pi, 200);
    x = A * cos(theta);
    y = A * sin(theta);
end