
function line_1(M,t)% 徑向直線1
    pa = pitch_angle(t);
    rb = base_radius(M,t); % 基圓半徑
    rr = root_radius(M,t); % 齒根圓半徑
    i = 0;
    if rb < rr
        % pass
    else
        while i <= t
            L = linspace(rr, rb, 100);  % 生成從齒根圓到基圓的100個點
            theta = L * 0;  % 這樣theta將會是長度與L相同的零向量
            polarplot(theta + pa*i, L, 'g');  % 極座標畫徑向直線
            i = i + 1;
        end
    end
end
