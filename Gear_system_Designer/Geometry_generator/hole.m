
function hole(A)% 軸
    theta = linspace(0, 2*pi, 200);
    R = A * ones(size(theta));
    polarplot(theta, R, 'r'); % 畫中心孔
end
