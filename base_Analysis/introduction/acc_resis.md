# 車輛阻力簡化評估 (Simple Resistance Estimation)

* [檔案位置](../acc_resis.m)

## 阻力分類
主要可以將阻力分成以下兩類，分別是車輪和車體阻力。

### 車輪阻力包含：

1. 輪胎與輪組慣性
2. 傳動系統啟動阻力
3. 滾動阻力

### 車體阻力包含：

1. 車輛啟動阻力
2. 爬坡阻力
3. 空氣阻力

## 1. 輪組慣性力 (Rotational Inertia Force)

當車輛加速時，車輪需要被旋轉，因此輪組慣性會產生額外負載。

$$
a_{max} = \mu_w g
$$

$$
\alpha = \frac{a_{max}}{r_w}
$$

$$
F_{inertia} = \frac{I \alpha}{r_w}
$$
* $ \mu_w $ 為輪胎摩擦係數
* $ g $ 為重力加速度
* $ r_w $ 為輪胎半徑
## 2. 傳動系統啟動阻力 (Drivetrain Start Resistance)
傳動系統在啟動時可能存在摩擦或靜摩擦扭矩。

$$
F_{start,w} = \frac{M_{start}}{r_w}
$$


## 3. 滾動阻力 (Rolling Resistance)
輪胎與地面接觸會產生滾動阻力。

$$
F_{rr} = C_{rr} m g
$$

* $ C_{rr} $ 為滾動阻力係數

## 4. 車輛啟動阻力 (Static Start Resistance)

車輛在靜止時需要克服輪胎靜摩擦：

$$
F_{start,c} = m g \mu_s
$$
* $ \mu_s $ 為靜摩擦係數

## 5. 爬坡阻力 (Grade Resistance)

若車輛行駛於坡度為 $ \theta $ 的道路：

$$
F_{slope} = m g \sin(\theta)
$$

## 6. 空氣阻力 (Aerodynamic Drag)
### (1) 黏滯阻力 (Stokes drag)

$$
F_{air,1} = b v
$$

$$
b = 6 \pi r \eta_{air}
$$

$r$ 為等效半徑：

$$
r = \sqrt{h^2+w^2}
$$

### (2) 二次空氣阻力 (Quadratic drag)

常見空氣阻力模型：

$$
F_{air,2} = \frac{1}{2} C_d \rho A v^2
$$

* $C_d$ ：阻力係數
* $\rho$ ：空氣密度
* $A$ ：迎風面積

迎風面積：

$$
A = h \times w
$$

### 總空氣阻力

$$
F_{air} = F_{air,1} + F_{air,2}
$$

# 阻力總和

$$
F_{car} =
F_{air} + F_{slope} + F_{start,c}
$$

$$
F_{wheel} =
F_{rr} + F_{start,w} + F_{inertia}
$$

$$
F_{total} =
\frac{F_{car}}{4} + F_{wheel}
$$

並考慮傳動效率 $\eta$：

$$
F_{effective} =
\frac{F_{total}}{\eta}
$$

# 7. 啟動扭力需求

輪胎需要提供的最小扭力：

$$
T_{start} =
F_{total} r_w
$$


# 8. 減速機齒輪比下限
$$
z =
\frac{SF \cdot T_{start}}{T_{motor,max}}
$$


此值代表 **減速機最小齒輪比需求** ，以上做法是在大大高估阻力數值，但為了確保不發生車輛可能無法克服最大阻力順利起步的問題才會進行極度保守到不合理的假設，實際進行模擬不會這樣計算。
