function [x, y] = line_1_xy(M, t, theta_offset, i)
    pa = pitch_angle(t);
    rb = base_radius(M, t);
    rr = root_radius(M, t);
    x = []; y = [];
    if rb >= rr
        L = linspace(rr, rb, 100);
        theta = pa * i + theta_offset;
        x = L .* cos(theta);
        y = L .* sin(theta);
    end
end
