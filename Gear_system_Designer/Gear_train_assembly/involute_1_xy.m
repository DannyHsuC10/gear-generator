
function [x, y] = involute_1_xy(M, t, theta_offset, i)
    pa = pitch_angle(t);
    rt = tip_radius(M, t);
    rb = base_radius(M, t);
    rr = root_radius(M, t);
    x = []; y = [];
    if rb < rr
        R = linspace(rt, rr, 100);
    else
        R = linspace(rt, rb, 100);
    end
    theta = -involutetheta(R, rb) + pa * i + theta_offset;
    x = R .* cos(theta);
    y = R .* sin(theta);
end
