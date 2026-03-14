%% 齒數組合計算
% 初始設定
clc; clear;
addpath('data');
load_data('gear')

T_all = fix(D_max/M);
%% 範圍控制
% 太陽輪範圍
T_s_min = T_min;

T_s_max = T_all-2*T_min;% 尺寸限制

T_s_list = T_s_min:1:T_s_max;
fprintf("太陽齒數範圍 %d ~ %d \n", T_s_max,T_s_min);

% 第一層行星齒範圍
T_p1_min = T_min;

T_p1_max = (T_all-T_min)/2;% 尺寸限制

T_p1_list = T_p1_min:1:T_p1_max;
fprintf("第一行星齒數範圍 %d ~ %d \n", T_p1_min,T_p1_max);

% 第二層行星齒範圍
T_p2_min = T_min;

T_p2_max = T_p1_max;

T_p2_list = T_p2_min:1:T_p2_max;
fprintf("第二行星齒數範圍 %d ~ %d \n", T_p2_min, T_p2_max);

% 尺環範圍
T_r_min = T_min*3;

T_r_max = T_all; % 尺環尺寸限制

T_r_list = T_r_min:1:T_r_max;
fprintf("尺環齒數範圍 %d ~ %d \n", T_r_min, T_r_max);

%% 限制關係
function g = gcd(a, b)
    % 計算最大公因數
    while b ~= 0
        temp = b;
        b = mod(a, b);
        a = temp;
    end
    g = a;
end

valid_combinations = []; % 用來存放符合條件的組合

% 計數器初始化
count_size = 0;
count_geometry = 0;
count_phase = 0;
count_periodic = 0;
count_all = 0;
count_ratio = 0;

for i = 1:length(T_s_list)
    for j = 1:length(T_r_list)
        for k = 1:length(T_p1_list)
            for m = 1:length(T_p2_list)

                T_s  = T_s_list(i);
                T_r  = T_r_list(j);
                T_p1 = T_p1_list(k);
                T_p2 = T_p2_list(m);
                % 布林遮罩建立
                % -----------------------------------

                % 尺寸限制
                size_condition = (2*T_p1 + T_s <= T_all);

                % 幾何限制
                geometry_condition = (T_s + T_p1 + T_p2 == T_r);

                % 最大公因數
                P = gcd(T_p1, T_p2);

                % K 計算
                K = (T_s*T_p2 - T_r*T_p1) / (3*P);

                % 相位限制
                phase_condition = (mod(K,1) == 0);

                % 週期限制
                periodic_condition = (P ~= 1);

                % 減速比限制

                z1 = T_p1/T_s;
                z2 = T_r/T_p2;
                z_all = z1*z2;
                ratio_condition = z_all>z;
                
                % 計數器累加
                if size_condition, count_size = count_size + 1; end
                if geometry_condition, count_geometry = count_geometry + 1; end
                if phase_condition, count_phase = count_phase + 1; end
                if periodic_condition, count_periodic = count_periodic + 1; end
                if ratio_condition, count_ratio = count_ratio + 1; end

                % size_condition && geometry_condition && phase_condition && periodic_condition && ratio_condition
                % 全部條件同時成立
                if size_condition && geometry_condition && phase_condition && periodic_condition && ratio_condition
                    count_all = count_all + 1;
                    valid_combinations = [valid_combinations; T_s, T_r, T_p1, T_p2,z_all];
                end
            end
        end
    end
end


%% 輸出結果
% 顯示統計結果
count_raw = length(T_s_list)*length(T_r_list)*length(T_p1_list)*length(T_p2_list);
fprintf('總數量: %d\n', count_raw);
fprintf('尺寸限制通過數量: %d\n', count_size);
fprintf('幾何限制通過數量: %d\n', count_geometry);
fprintf('相位限制通過數量: %d\n', count_phase);
fprintf('週期限制通過數量: %d\n', count_periodic);
fprintf('速比限制通過數量: %d\n', count_ratio);
fprintf('全部條件同時通過數量: %d\n', count_all);


% 顯示符合的組合
if isempty(valid_combinations)
    disp('沒有符合條件的組合');
else
    disp('符合所有限制的組合：');
    disp(array2table(valid_combinations, ...
        'VariableNames', {'T_s','T_r','T_p1','T_p2','z'}));
end
