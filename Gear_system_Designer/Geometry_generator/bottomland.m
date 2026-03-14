
function bottomland(M, t)% 齒底
    pa = pitch_angle(t);
    hpa = halfpitch_angle(t);
    rp = pitch_radius(M, t);
    rb = base_radius(M, t);
    rr = root_radius(M, t);

    a2 = involutetheta(rp, rb);
    a1 = hpa - 2 * a2;

    for i = 0:t
        theta = linspace(0, a1, 100);
        R = rr * ones(size(theta));
        polarplot(theta + pa * i, R, 'r'); % 畫齒根圓弧
    end
end
