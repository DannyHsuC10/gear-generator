
function line_2(M, t)% 徑向直線2
    pa = pitch_angle(t);
    hpa = halfpitch_angle(t); % 周節半角
    rp = pitch_radius(M, t);  % 節圓半徑
    rb = base_radius(M, t);   % 基圓半徑
    rr = root_radius(M, t);   % 齒根圓半徑
    a2 = involutetheta(rp, rb);           % 漸開線角度 - 基圓至節圓
    a1 = hpa - 2 * a2;                    % 底部角度
    if rb < rr
        % 不畫
    else
        for i = 0:t
            L = linspace(rr, rb, 100);  % 從齒根到基圓的半徑值
            theta = ones(size(L)) * a1 + pa * i;  % 每條線角度都固定為 a1+pa*i
            polarplot(theta, L, 'g');  % 畫極座標線段，綠色
        end
    end
end
