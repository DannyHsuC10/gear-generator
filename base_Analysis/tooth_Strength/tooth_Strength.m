%% 簡單強度評估
clear; clc; close all;
addpath('data');
load_data('strength')


% 範圍設定
T_list = T_min:100;
M1 = zeros(size(T_list));
M2 = zeros(size(T_list));
M_Target = zeros(size(T_list));
T_node = T_min;

% 計算模數
for i = 1:length(T_list)
    T = T_list(i);
    M1(i) = ((6*T_motor*z*SF)/(T*pi*h*tau_ult))^0.5;%最小強度
    M2(i) = M_min;%最小加工精度
    M_Target(i) = max(M2(i),M1(i));%實際使用模數
    if M1(i) > M2(i)
        M_Target(i) = M1(i);
       fprintf('第%d齒使用模數 : %f\n',T,M_Target(i));
       T_node = T;
    end
end

% 畫圖
fprintf('齒數%d後都使用最小精度%f\n',T_node,M_min);

figure();
plot(T_list, M1,'b-');
hold on;
plot(T_list, M2,'r-');
grid on; % 顯示網格
title('模數太陽輪齒數關係');
xlabel('T');
ylabel('M(mm)');