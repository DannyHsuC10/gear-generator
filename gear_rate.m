%% 齒輪比計算
% 初始設定
clc; clear;
addpath('data');
load_data('acc')

l_r = l-l_f;     % 後軸距 [m]
v_target = v_target/3.6; %換算單位

% =========================
% 計算靜態正向力
% =========================
N_r_static = m * g * l_f / l;
N_f_static = m * g - N_r_static;

fprintf("Rear static load  : %.2f N\n", N_r_static);
fprintf("Front static load : %.2f N\n", N_f_static);
% =========================
% 假設目標加速度 (輪胎極限)
% =========================
a_max = mu_w * g;

% =========================
% 動態正向力 (最大加速造成荷重轉移)
% =========================
F_x_total = m * a_max;

N_r = (F_x_total * h_cog + m * g * l_f) / l;
delta_N = N_r - N_r_static;

N_f = N_f_static - delta_N;

fprintf("Rear dynamic load : %.2f N\n", N_r);
fprintf("Front dynamic load: %.2f N\n", N_f);

% =========================
% 前後輪最大摩擦力
% =========================
F_xf = mu_w * N_f;
F_xr = mu_w * N_r;

error = F_xf + F_xr - F_x_total;

fprintf("Front traction limit : %.2f N\n", F_xf);
fprintf("Rear traction limit  : %.2f N\n", F_xr);

fprintf("error : %.2f N\n", error);% 檢查>>是否輸出力量等於目標加速力

% =========================
% 扭矩需求
% =========================
M_ar = F_xr * r_w;

M_af = F_xf * r_w;

fprintf("Front moment limit : %.2f Nm\n", M_af);
fprintf("Rear moment limit  : %.2f Nm\n", M_ar);

M_a = max(M_ar,M_af);

fprintf("max moment  : %.2f Nm\n", M_a);

% =========================
% 馬達扭矩與齒輪比
% =========================

M_w = M_a / 2; % 假設左右輪平均

Z_a = M_w / T_motor_max;

fprintf("Wheel torque required : %.2f Nm\n", M_w);
fprintf("Gear ratio (accel) : %.2f\n", Z_a);

% =========================
% 車輪極速齒比
% =========================
omega_w_max = v_target / r_w;

RPM_w = omega_w_max * 60 / (2 * pi);

Z_ts = RPM_motor_max / RPM_w;

fprintf("Gear ratio (top speed): %.2f\n", Z_ts);

% =========================
% 平均考量
% =========================

Z_avg = (Z_ts+Z_a)/2;
fprintf("Gear ratio (avg): %.2f\n", Z_avg);