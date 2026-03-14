
function involute_1(M, t)% 漸開線1
    pa = pitch_angle(t);
    rt = tip_radius(M, t);
    rb = base_radius(M, t);
    rr = root_radius(M, t);
    for i = 0:t
        if rb < rr
            R = linspace(rt, rr, 100);  % 齒頂 -> 齒根
        else
            R = linspace(rt, rb, 100);  % 齒頂 -> 基圓
        end
        theta = -involutetheta(R, rb);  % 反向漸開線
        polarplot(theta + pa * i, R, 'b');
    end
end
