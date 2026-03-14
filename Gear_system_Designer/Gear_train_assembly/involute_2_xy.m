
function [x, y] = involute_2_xy(M, t, theta_offset, i)
    pa = pitch_angle(t);
    hpa = halfpitch_angle(t);
    rt = tip_radius(M, t);
    rb = base_radius(M, t);
    rp = pitch_radius(M, t);
    a2 = involutetheta(rp, rb);
    a1 = hpa - 2 * a2;
    rr = root_radius(M, t);
    x = []; y = [];
    if rb < rr
        R = linspace(rr, rt, 100);
    else
        R = linspace(rb, rt, 100);
    end
    theta = involutetheta(R, rb) + a1 + pa * i + theta_offset;
    x = R .* cos(theta);
    y = R .* sin(theta);
end
