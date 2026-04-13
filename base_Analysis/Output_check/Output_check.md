# 車輛加速能力驗證 (Acceleration Verification)
* [檔案位置](Output_check.m)

此程式建立一個非常簡化的車輛縱向評估模型：

$$
m\dot{v} = F_{traction}
$$

## 1. 減速機放大比

減速機由兩組齒輪構成，齒輪比為

$$
z = \left(\frac{T_{p1}}{T_s}\right)\left(\frac{T_r}{T_{p2}}\right)
$$

- $T_s$ ：太陽齒輪齒數  
- $T_{p1}$ ：第一組行星齒輪齒數  
- $T_{p2}$ ：第二組行星齒輪齒數  
- $T_r$ ：內齒輪齒數  

## 2. 輸出
若馬達最大扭矩為

$$
T_{motor,max}
$$

減速機輸出扭矩為

$$
T_{out} = T_{motor,max} \cdot z
$$

此值為**車輪端最大輸出扭矩**。


$$
F_{motor} = \frac{T_{out}}{r_w}
$$

輪胎可提供的推進力為

$$
F_{axle} = 2F_{motor}
$$
---
減速機同時會降低轉速。

$$
RPM_{out} = \frac{RPM_{motor,max}}{z}
$$

輪胎線速度為

$$
v = 2\pi r_w \cdot \frac{RPM_{out}}{60}
$$

並轉換為 km/h：

$$
v_{max} = \frac{2\pi r_w \cdot RPM_{out} \cdot 60}{1000}
$$

## 3 輪胎抓地力限制
由於加速會產生縱向重心轉移：

$$
F_x = ma
$$

後輪附載：

$$
N_r = \frac{F_x h_{cog} + mg l_f}{l}
$$

前輪附載：

$$
N_f = mg - N_r
$$


輪胎最大可提供摩擦力為

$$
F_{max} = \mu_w N
$$

$$
F_r \leq \mu_w N_r
$$

$$
F_f \leq \mu_w N_f
$$

## 4 總推進力

總推力為前後輪合力：

$$
F = F_f + F_r
$$

$$
a = \frac{F}{m}
$$

$$
v_{t+1} = v_t + a \cdot dt
$$

$$
v \le v_{max}
$$

$$
x_{t+1} = x_t + v \cdot dt
$$

