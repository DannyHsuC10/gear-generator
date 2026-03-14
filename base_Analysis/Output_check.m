%% 驗證結果
clear; clc; close all;
addpath('../data');
load_data('tooth');
load_data('acc');

% =========================
% 輸出極限
% =========================

z = (Tp1/Ts)*(Tr/Tp2);
fprintf('放大比: %.2f \n',z)

T_out = T_motor_max*z;% -49 可以簡單估算阻力減去
fprintf('輸出扭矩: %.2f Nm\n',T_out)

RPM_out = RPM_motor_max/z;
v_max = pi*r_w*2*RPM_out*60/1000;
fprintf('最高速度: %.2f km/h\n',v_max)

F_motor = T_out/r_w;
F_axle = F_motor*2;
fprintf('軸極大數出: %.2f N\n',F_axle)
%% =========================
% 加速度範圍
% =========================
a = 0;
v = 0;
x = 0;
t_max = 10;
dt = 0.1;

a_list = zeros(t_max/dt);
v_list = zeros(t_max/dt);
x_list = zeros(t_max/dt);
t_list = zeros(t_max/dt);

% =========================
% 計算加速過程
% =========================
for t = 1:(t_max/dt)
    
    F_x_total = m * a;
    
    % 計算負載
    N_r = (F_x_total * h_cog + m * g * l_f) / l;
    N_f = m * g - N_r;
    
    % 設定最大輸出
    Ff = F_axle;
    Fr = F_axle;
    
    % 判斷
    if F_axle>N_r*mu_w
        Fr = N_r*mu_w;
    end

    if F_motor*2>N_f*mu_w
        Ff = N_f*mu_w;
    end

    F = Ff+Fr;
    a = F/m;

    v = v + a*dt;
    v = min(v,v_max/3.6);
    x = x + v*dt;
    a_list(t) = a/g;
    v_list(t) = v*3.6;
    x_list(t) = x;
    t_list(t) = t*dt;
end

% =========================
% 畫圖
% =========================

figure;

% 位移子圖
subplot(3,1,1);
plot(t_list, x_list, 'b-');
xlabel('時間 (s)');
ylabel('位移 (m)');
title('加速過程位移圖');
grid on;

% 速度子圖
subplot(3,1,2);
plot(t_list, v_list, 'r-');
xlabel('時間 (s)');
ylabel('速度 (km/h)');
title('加速過程速度圖');
grid on;

% 加速度子圖
subplot(3,1,3);
plot(t_list, a_list, 'g-');
xlabel('時間 (s)');
ylabel('加速度 (g)');
title('加速過程加速度圖');
grid on;
