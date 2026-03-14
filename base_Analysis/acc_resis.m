%% 簡單阻力評估

clc; clear;
addpath('../data');
load_data('resis')

v = v/3.6;%換算單位
% 車輪阻力
% ====================
% 慣性力
a_max = mu_w*g;

alpha = a_max/r_w;

F_inertia = I*alpha/r_w;
fprintf("最大慣性力  : %.2f N\n", F_inertia);

% 啟動阻力 傳動

F_start_w = M_start/r_w;
fprintf("啟動阻力(傳動) : %.2f N\n", F_start_w);

% 滾動阻力
F_rr = Crr*m*g;
fprintf("滾動阻力  : %.2f N\n", F_rr);

% 車身阻力
% =====================
% 起動阻力 車輛
F_start_c = m*g*mu_s;
fprintf("起動阻力(車輛) : %.2f N\n", F_start_c);

% 爬坡力
F_slope= m*g*sind(theta_slope);
fprintf("爬坡力  : %.2f N\n", F_slope);

% 空阻力
A = h*w;

r = (h^2+w^2)^0.5;

b = 6*pi*r*eta_air;

F_air_1 = b*v;

F_air_2 = 0.5*C*rho*A*v^2;

F_air = F_air_2+F_air_1;
fprintf("最大空氣阻力  : %.2f N\n", F_air);

% 最大阻力估算
% ======================
% 車體阻力
resis_car = F_air+F_slope+F_start_c;
fprintf("車體阻力  : %.2f N\n", resis_car);

%車輪阻力
resis_w = F_rr+F_start_w+F_inertia;
fprintf("車輪阻力  : %.2f N\n", resis_w);

resis_all =  (resis_car/4+resis_w)/eta;

% Calculate total resistance
fprintf("最大總阻力  : %.2f N\n", resis_all);

% 啟動扭力
torque_start = resis_all * r_w;
fprintf("極大化啟動扭力  : %.2f Nm\n", torque_start);

% 減速機極限
z = SF*torque_start/T_motor_max;
fprintf("齒輪比設計下限 :  %.2f",z)