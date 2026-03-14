
function topland(M, t)% 齒頂
    pa = pitch_angle(t);
    hpa = halfpitch_angle(t); % 周節半角
    rt = tip_radius(M, t);    % 齒頂圓半徑
    rp = pitch_radius(M, t);  % 節圓半徑
    rb = base_radius(M, t);   % 基圓半徑
    a2 = involutetheta(rp, rb);
    a3 = involutetheta(rt, rb) - a2;
    a1 = hpa - 2 * a2;
    a4 = hpa - 2 * a3;

    for i = 0:t
        theta = linspace(a1 + a2 + a3, a1 + a2 + a3 + a4, 100);
        R = rt * ones(size(theta));
        polarplot(theta + pa * i, R, 'r'); % 畫齒頂圓弧
    end
end
