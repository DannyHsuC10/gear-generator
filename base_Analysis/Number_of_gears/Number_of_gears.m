%% 行星齒輪數量判斷
clc;clear;
addpath('data')
load_data('tooth')

Rs = Ts*M;
Rp1 = Tp1*M;
% 角度計算
theta = 2*asin((Rp1+2*M)/(Rp1+Rs));
fprintf('角度: %.2f\n',theta)

theta_lim = 2*pi/n;
fprintf('極限角度: %.2f\n',theta_lim)

theta_over = 2*pi/(n+1);
fprintf('增加齒輪後角度: %.2f\n',theta_over)

% 判斷
if theta>theta_lim
    disp('幾何干涉，需減少行星齒輪數量')
else
    disp('無干涉')
    if theta>theta_over
        disp('行星齒輪數量極限狀態')
    else
        disp('可嘗試更多行星齒輪數量')
    end
end

