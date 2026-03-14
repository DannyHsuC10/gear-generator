# Gearbox design
這個模組用於設計齒輪箱，可生成的數據給kisssoft使用。

## 主要設計流程
1. 用 [減速比計算工具](introduction/Gear_Ratio_Calculation.md) 計算齒比(可搭配 base Analysis 1,2 號工具使用)
1. 用 [行星齒輪齒數組合搜尋程式](introduction/number_of_teeth.md) 解出齒數(可搭配 base Analysis 3,4,5 號工具使用)
1. 用 [齒輪系工具](introduction/gear_sys.md) 看看整個齒輪系的樣子(可搭配 base Analysis 6 號工具使用)
1. 用 kisssoft 進行減速機設計

## 主要工具
1. [減速比計算工具(gear_rate)](introduction/Gear_Ratio_Calculation.md) : 更改車輛狀況(data/acc.csv)，就可得出需求齒比。
1. [行星齒輪齒數組合搜尋程式(Number_of_teeth)](introduction/number_of_teeth.md) : 更改齒輪設計條件(data/gear.csv)，就可以得到齒數組合。
1. [齒輪系布局展示程式(Gear_system_Designer)](introduction/gear_sys.md) : 更改齒輪齒數(data/tooth)，可以看到所有齒輪長怎樣。
1. [齒輪設計介面(Gear_Design_Interface)](introduction/Gear_Design_Interface.md):用GUI介面更改齒輪參數設計齒輪，關閉之後會將齒輪參數儲存成excel檔案。

## data資料夾
這是資料庫，matlab會讀取這邊的參數進行計算基本上不需要改動程式碼，是改這邊的資料，用以下方式呼叫excel資料。
* [呼叫工具](data/load_data.m)
```matlab
addpath('data')
load_data('檔案名稱')
```

## base Analysis資料夾
裡面的內容用於簡單輔助分析，但多是簡化模型自行判斷數據可靠性並參考使用。提供以下工具 : 
1. [加速負載](base_Analysis/introduction/acc_load.md) : 簡單分析加速時重心轉移情況
1. [加速阻力](base_Analysis/introduction/acc_resis.md) : 加速時候的阻力簡單評估
1. [行星齒輪數量和理性判斷](base_Analysis/introduction/Number_of_gears.md) : 判斷是否會發生干涉，出現干涉 **一定必須** 改變輪系配置
1. [輸出判斷](base_Analysis/introduction/Output_check.md) : 用於簡單檢查最後輸出結果
1. [簡單強度評估](base_Analysis/introduction/tooth_Strength.md) : 可靠度有限，粗略評估強度用。
1. [齒輪對計算總表](base_Analysis/introduction/Gear_Transmission_Sheet.md) : 數據計算表，快速計算很多數據資料。

## Gear system Designer資料夾
這是[齒輪系布局展示程式(Gear_system_Designer)](introduction/gear_sys.md) 的函式庫，裡面有齒輪參數計算的底層和xy坐標系、極坐標系的齒輪繪圖邏輯。極座標主要方便產生單一齒輪草圖，而xy坐標系可以產生整個行星齒輪組。

* 整體架構
```
Gear_system_Designer/
│
├─ gear_data_printer >> 齒輪參數印出
│   ├─ gear_param    >> 21個底層函式
├─ gear_sketch       >> 極座標齒輪
│   ├─ gear_param    >> 21個底層函式
│   └─ Geometry_generator >> 7個極座標曲線繪製底層函式
├─ gear_sketch_xy    >> xy坐標系齒輪
│   ├─ gear_param    >> 21個底層函式
│   └─ Geometry_generator >> 8個xy標曲線繪製底層函式
└─ data              >> 資料庫
    └─ tooth         >> 齒數資料

```
## 其他
1. Gear_Designer : [齒輪設計介面(Gear_Design_Interface)](introduction/Gear_Design_Interface.md)的模組化底層，想知道計算細節要自己去看 Mechanics 裡面的教學。
1. introduction : 介紹資料不用管他
## 改進方向
### 容易
1. base Analysis裡面的工具都可以優化讓他們不要只是簡單模型
1. 改善[齒輪設計介面(Gear_Design_Interface)](introduction/Gear_Design_Interface.md)動畫卡頓
1. [齒輪系布局展示程式(Gear_system_Designer)](introduction/gear_sys.md)需要解決對齒問題不讓他們干涉
### 較難
1. [減速比計算工具](introduction/Gear_Ratio_Calculation.md)可以根據賽道特性進行最佳化計算
2. [齒輪對計算總表](base_Analysis/introduction/Gear_Transmission_Sheet.md)檢查正確性並進行優化