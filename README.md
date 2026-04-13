# Transmission-system
這個模組用於設計齒輪箱，可生成的數據給kisssoft使用。

## 1. [減速比計算工具(gear_rate)](gear_rate/Gear_Ratio_Calculation.md)
* 需求:車重、車輪x摩擦、軸距、馬達資料

首先基於車輛加速的重心轉移計算需求扭矩與轉速，並計算齒比。(可搭配 base Analysis 1,2 號工具使用)
## 2. [行星齒輪齒數組合搜尋程式(Number_of_teeth)](number_of_teeth/number_of_teeth.md)
* 需求:羊角架構、輪端架構

在討論出hub空間後，我們可以解出整個齒輪系的各個齒輪齒數。(可搭配 base Analysis 3,4,5 號工具使用)3、4步驟僅為輔助，工具成熟度不足時間不構請直接跳至第5步驟使用商用軟體kisssoft。
## 3. [齒輪系布局展示程式(Gear_system_Designer)](Gear_system_Designer/gear_sys.md)
根據算出的齒輪齒數修改csv表格，可以看到所有齒輪長怎樣。看看整個齒輪系的樣子(可搭配 base Analysis 6 號工具使用)
## 4. [齒輪設計介面(Gear_Design_Interface)](Gear_Designer/Gear_Design_Interface.md)
用GUI介面更改齒輪參數設計齒輪，關閉之後會將齒輪參數儲存成excel檔案。可以利用參數修改齒輪曲線細節。

## 5. 用 kisssoft 進行減速機設計
* 需求:kisssoft贊助

kisssoft是專門用來設計整個齒輪箱的商用軟體，根據大量齒輪經驗公式計算出細節資料，以下簡單說明大致步驟。

1. 開啟kisssys範例檔案進行修改，使用輪端預計的幾何與，步驟2的齒數與模數資料
1. 確定幾何建立完成開啟kisssoft進行每顆齒輪分析
1. 確保齒根安全係數與齒面安全係數>1(透過調整轉位系數、尺面寬、齒輪油提升安全性，也可透過中心距離搭配轉位系數調整)
1. 確定設計正常後出圖發包
## base Analysis資料夾
裡面的內容用於簡單輔助分析，但多是簡化模型自行判斷數據可靠性並參考使用。提供以下工具 : 
1. [加速負載](base_Analysis/acc_load/acc_load.md) : 簡單分析加速時重心轉移情況
1. [加速阻力](base_Analysis/acc_resis/acc_resis.md) : 加速時候的阻力簡單評估
1. [行星齒輪數量和理性判斷](base_Analysis/Number_of_gears/Number_of_gears.md) : 判斷是否會發生干涉，出現干涉 **一定必須** 改變輪系配置
1. [輸出判斷](base_Analysis/Output_check/Output_check.md) : 用於簡單檢查最後輸出結果
1. [簡單強度評估](base_Analysis/tooth_Strength/tooth_Strength.md) : 可靠度有限，粗略評估強度用。
1. [齒輪對計算總表](base_Analysis/Gear_Transmission_Sheet.md) : 數據計算表，快速計算很多數據資料。
1. [齒輪慣性](/base_Analysis/Rotational_inertia/inertia.md) : 快速估算整個齒輪箱的轉動慣量。

## 改進方向
### 容易
1. base Analysis裡面的工具都可以優化讓他們不要只是簡單模型
1. 改善[齒輪設計介面(Gear_Design_Interface)](Gear_Designer/Gear_Design_Interface.md)動畫卡頓
1. [齒輪系布局展示程式(Gear_system_Designer)](Gear_system_Designer/gear_sys.md)需要解決對齒問題不讓他們干涉
### 較難
1. [減速比計算工具(gear_rate)](gear_rate/Gear_Ratio_Calculation.md)可以根據賽道特性進行最佳化計算
2. [齒輪對計算總表](base_Analysis/Gear_Transmission_Sheet.md) 檢查正確性並進行優化