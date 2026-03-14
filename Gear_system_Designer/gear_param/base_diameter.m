
function Db = base_diameter(M, T)
    % 基圓直徑(模數, 齒數)
    theta = 20; % 角度
    Db = M * T * cos(deg2rad(theta));
end
