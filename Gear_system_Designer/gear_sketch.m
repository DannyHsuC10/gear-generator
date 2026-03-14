function out = gear_sketch(gear_names,T_values,M,ad)
    for i = 1:length(T_values)
        % 提取齒數
        T = T_values(i);
        gear_name = gear_names{i};
        % 準備畫圖
        figure();
        polaraxes;  % 創建極座標系
        hold on;
        title(gear_name);
        line_2(M,T);
        line_1(M,T);
        involute_1(M,T);
        involute_2(M,T);
        topland(M,T);
        bottomland(M,T);
        ar = ad(i)/2;
        hole(ar);
        hold off; 
    end

