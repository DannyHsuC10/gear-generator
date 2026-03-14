
function [x, y] = topland_xy(M, t, theta_offset, i)
    pa = pitch_angle(t);
    hpa = halfpitch_angle(t);
    rt = tip_radius(M, t);
    rp = pitch_radius(M, t);
    rb = base_radius(M, t);
    a2 = involutetheta(rp, rb);
    a3 = involutetheta(rt, rb) - a2;
    a1 = hpa - 2 * a2;
    a4 = hpa - 2 * a3;
    theta = linspace(a1 + a2 + a3, a1 + a2 + a3 + a4, 100) + pa * i + theta_offset;
    R = rt * ones(size(theta));
    x = R .* cos(theta);
    y = R .* sin(theta);
end
