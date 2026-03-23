clc; clear; close all;
addpath('../data');
load_data('tooth')

% 定義參數
T_values = [Ts, Tp1, Tp2]; % 齒數
ad = [0, 12, 12];          % 軸徑
h = [20, 20, 10];          % 高度
D = 7870;                  % 密度 (kg/m^3)
N = 3;
% 轉動慣量計算函數
function I = gear_inertia(D, d, h)
    r = d/2;
    A = pi * r^2;
    V = A * h;
    m = V * D;
    I = 0.5 * m * r^2;
end

% 迴圈計算所有齒輪轉動慣量
I_values = zeros(1, length(T_values)); % 預先配置結果陣列
for i = 1:length(T_values)
    d = T_values(i) * M; % 齒輪直徑
    I_values(i) = gear_inertia(D, d/1000, h(i)) - gear_inertia(D, ad(i)/1000, h(i));
end

% 顯示結果
disp('各齒輪的轉動慣量：');
disp(I_values);

%計算總轉動慣量
z2 = Tr/Tp2;
z = Tp1*z2/Ts;
%相對轉動慣輛轉換
Ip = z2^2*(I_values(2)+I_values(3));
Is = z^2*I_values(1);

fprintf("行星齒輪轉動慣量 : %g\n",Ip)
fprintf("太陽齒輪轉動慣量 : %g\n",Is)
I_all = Ip*3+Is;
fprintf("總轉動慣量 : %g\n",I_all)