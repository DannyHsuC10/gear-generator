
function involute_2(M, t)% 漸開線2
    pa = pitch_angle(t);
    hpa = halfpitch_angle(t);
    rt = tip_radius(M, t);
    rb = base_radius(M, t);
    rr = root_radius(M, t);
    a2 = involutetheta(pitch_radius(M, t), rb);  % 中間變數給定
    a1 = hpa - 2 * a2;  % 底部角度
    for i = 0:1:t
        if rb < rr
            R = linspace(rr, rt, 100);  % 齒根 -> 齒頂
        else
            R = linspace(rb, rt, 100);  % 基圓 -> 齒頂
        end
        theta = involutetheta(R, rb) + a1;  % 順向漸開線加底部偏移
        polarplot(theta + pa * i, R, 'b');
    end
end
