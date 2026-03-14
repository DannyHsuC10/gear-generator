
function [x, y] = line_2_xy(M, t, theta_offset, i)
    pa = pitch_angle(t);
    hpa = halfpitch_angle(t);
    rp = pitch_radius(M, t);
    rb = base_radius(M, t);
    rr = root_radius(M, t);
    a2 = involutetheta(rp, rb);
    a1 = hpa - 2 * a2;
    x = []; y = [];
    if rb >= rr
        L = linspace(rr, rb, 100);
        theta = a1 + pa * i + theta_offset;
        x = L .* cos(theta);
        y = L .* sin(theta);
    end
end
