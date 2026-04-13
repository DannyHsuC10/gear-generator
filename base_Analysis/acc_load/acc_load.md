# 車輛加速時的前後輪附載分析
* [檔案位置](acc_load.m)

## 1. 靜態附載 (Static Load)

當車輛沒有加速時 $(a=0)$，前後輪附載只由重力與重心位置決定。

- 車重：$m$
- 重力加速度：$g$
- 軸距：$l$
- 前軸到重心距離：$l_f$
- 後軸到重心距離：$l_r$

$$
l_r = l - l_f
$$

$$
N_r = \frac{m g l_f}{l}
$$

$$
N_f = m g - N_r
$$

- $N_r$ ：後輪附載
- $N_f$ ：前輪附載

## 2. 加速過程 (Load Transfer)
車輛最大可達加速度通常由**輪胎摩擦係數** $\mu_w$ 限制：

$$
a_{max} = \mu_w g
$$

$$
F_x = m a
$$

此力作用於重心高度 $h_{cog}$，產生一個**俯仰力矩 (pitch moment)**：

$$
M = F_x h_{cog}
$$

### 後輪附載

$$
N_r =
\frac{F_x h_{cog} + m g l_f}{l}
$$

### 前輪附載

$$
N_f + N_r = m g
$$

$$
N_f = m g - N_r
$$

## 3. 附載轉移

隨著加速度增加：

前輪附載 : $N_f \downarrow$

後輪附載 : $N_r \uparrow$

$$
\Delta N =
\frac{m a h_{cog}}{l}
$$


$$
N_r = N_{r,static} + \Delta N
$$

$$
N_f = N_{f,static} - \Delta N
$$

