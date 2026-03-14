function theta = involutetheta(R, r)% 角度計算
    theta = zeros(size(R));% 初始化 theta 為零
    valid_idx = R >= r;% 找出 R >= r 的有效區域
    phi = sqrt((R(valid_idx) ./ r).^2 - 1);% 對有效區域計算漸開線角度
    theta(valid_idx) = atan((tan(phi) - phi) ./ (1 + tan(phi)));% 對 R < r 的區域維持為零或 NaN（視需求）
    theta(~valid_idx) = NaN;  % 或 0，看你想不想略過它
end
