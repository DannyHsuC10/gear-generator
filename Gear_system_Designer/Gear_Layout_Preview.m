clc;clear;
addpath('gear_param');
addpath('Geometry_generator/');
addpath('Gear_train_assembly/');
addpath('data')
load_data('tooth')

% 齒輪名稱和齒數對應 進行基礎運算
gear_names = {'太陽齒輪', '行星齒輪', '行星齒輪2', '內齒輪'};
T_values = [Ts, Tp1, Tp2, Tr];%齒數
ad = [axle,axle,axle,tip_diameter(M, Tr)];%軸
gear_data_printer(gear_names,T_values,M)

%% 齒輪系簡圖

figure();
hold on;
axis equal;
title('行星齒輪系簡圖');
xlabel('X 軸');
ylabel('Y 軸');
grid on;

Rr = pitch_radius(Tr,M);
Rs = pitch_radius(Ts,M);
Rp = pitch_radius(Tp1,M);
Rp2 = pitch_radius(Tp2,M);

% 畫太陽齒輪
viscircles([0,0], Rs, 'Color','b');

% 畫內齒圈
viscircles([0,0], Rr, 'Color','g');

% 畫行星齒輪
theta = 2*pi/n;
for k = 0:n-1
    offset_angle = k*theta;
    % 行星齒輪圓心位置
    cx = (Rs+Rp)*cos(offset_angle);
    cy = (Rs+Rp)*sin(offset_angle);
    
    viscircles([cx, cy], Rp, 'Color','r');
    
    % 第二顆行星齒輪
    viscircles([cx, cy], Rp2, 'Color','r');
end

%% 畫出齒輪草圖
gear_sketch(gear_names,T_values,M,ad)

%% 齒輪系組合圖(對齒問題有待解決)
figure();
hold on;
axis equal;
title('行星齒輪系完整簡圖');
xlabel('X 軸');
ylabel('Y 軸');
grid on;

% 畫太陽齒輪外圓
viscircles([0,0], Rs, 'Color','b');
% 畫內齒圈
viscircles([0,0], Rr, 'Color','g');

% 畫太陽齒輪齒形 (中心在原點)
gear_sketch_xy(Ts,M,0,ad(1),0,0)
% 畫行星齒輪
theta = 2*pi/n;
for k = 0:n-1
    offset_angle = k*theta;
    cx = (Rs+Rp)*cos(offset_angle);
    cy = (Rs+Rp)*sin(offset_angle);

    % 第一顆行星齒輪齒形
    gear_sketch_xy(Tp1,M,offset_angle,ad(2),cx,cy)

    % 第二顆行星齒輪
    gear_sketch_xy(Tp2,M,offset_angle,ad(3),cx,cy)
end

% 畫內齒輪齒形 (中心在原點)
gear_sketch_xy(Tr,M,0,ad(4),0,0)