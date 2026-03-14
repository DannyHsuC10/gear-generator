function out = gear_data_printer(gear_names,T_values,M)
    for i = 1:length(T_values)
    % 提取齒數
        T = T_values(i);
        gear_name = gear_names{i};
        
        % 計算各種參數
        Dm = pitch_diameter(T, M);           % 節徑
        Rm = pitch_radius(T, M);            % 節圓半徑
        Cm = pitch_circumference(M, T);     % 節圓周長
        Dt = tip_diameter(M, T);            % 齒頂圓直徑
        Rt = tip_radius(M, T);              % 齒頂圓半徑
        Dr = root_diameter(M, T);           % 齒根圓直徑
        Rr = root_radius(M, T);             % 齒根圓半徑
        Db = base_diameter(M, T);           % 基圓直徑
        Rb = base_radius(M, T);             % 基圓半徑
        Add = Addendum(M);                  % 齒頂
        Ded = Dedendum(M);                  % 齒根
        H = tooth_height(M);                % 齒高
        Wd = working_depth(M);              % 工作深度
        C = clearance(M);                   % 齒輪間隙
        Cp = circular_pitch(M);             % 周節
        Tt = tooth_thickness(M);            % 齒厚
        Ts = tooth_space(M);                % 齒間
        F = fillet(M);                      % 齒根圓角半徑
        Dp = Diametral_pitch(M);            % 徑節
        Pa = pitch_angle(T);                      % 周節角度
        Hpa = halfpitch_angle(T);                 % 半周節角度
        
        % 使用 fprintf 輸出結果
        fprintf('\n齒輪: %s\n', gear_name);
        fprintf('節徑: %f, 節圓半徑: %f, 節圓周長: %f\n', Dm, Rm, Cm);
        fprintf('齒頂圓直徑: %f, 齒頂圓半徑: %f\n', Dt, Rt);
        fprintf('齒根圓直徑: %f, 齒根圓半徑: %f\n', Dr, Rr);
        fprintf('基圓直徑: %f, 基圓半徑: %f\n', Db, Rb);
        fprintf('齒頂: %f, 齒根: %f, 齒高: %f\n', Add, Ded, H);
        fprintf('工作深度: %f, 間隙: %f, 周節: %f\n', Wd, C, Cp);
        fprintf('齒厚: %f, 齒間: %f, 齒根圓角半徑: %f\n', Tt, Ts, F);
        fprintf('徑節: %f, 周節角度: %f, 半周節角度: %f\n', Dp, Pa, Hpa);
        fprintf('.......................................\n')
    end
end

    