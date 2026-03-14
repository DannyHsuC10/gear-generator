
function [x, y] = bottomland_xy(M, t, theta_offset, i)
    pa = pitch_angle(t);
    hpa = halfpitch_angle(t);
    rp = pitch_radius(M, t);
    rb = base_radius(M, t);
    rr = root_radius(M, t);
    a2 = involutetheta(rp, rb);
    a1 = hpa - 2 * a2;
    theta = linspace(0, a1, 100) + pa * i + theta_offset;
    R = rr * ones(size(theta));
    x = R .* cos(theta);
    y = R .* sin(theta);
end
