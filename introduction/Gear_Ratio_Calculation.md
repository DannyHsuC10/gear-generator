# 車輛齒輪比計算程式說明 (Gear Ratio Calculation for Vehicle)
* [檔案位置](../gear_rate.m)
## 正向力計算
### 靜態輪胎正向力

$$
N_{r,static} = \frac{m g l_f}{l}
$$

$$
N_{f,static} = mg - N_{r,static}
$$

### 最大加速度 (輪胎極限)

假設車輛加速能力受 **輪胎摩擦極限** 限制：

$$
a_{max} = \mu_w g
$$

$$
F_x = m a_{max}
$$

### 荷重轉移
當車輛加速時，重心高度會造成 **後輪荷重增加、前輪荷重減少**。

$$
N_r =
\frac{F_x h_{cog} + m g l_f}{l}
$$

$$
\Delta N = N_r - N_{r,static}
$$

$$
N_f = N_{f,static} - \Delta N
$$

## 扭矩需求
### 摩擦力計算
輪胎可提供的最大摩擦力為：

$$
F_{xf} = \mu_w N_f
$$

$$
F_{xr} = \mu_w N_r
$$

檢查是否符合力平衡：理論上應接近0

$$
error = F_{xf} + F_{xr} - F_x
$$


$$
error \approx 0
$$

### 輪胎扭矩需求
輪胎扭矩由牽引力與輪半徑決定。

$$
M_{af} = F_{xf} r_w
$$

$$
M_{ar} = F_{xr} r_w
$$

$$
M_a = \max(M_{ar}, M_{af})
$$

$$
M_w = \frac{M_a}{2}
$$

## 齒輪比
### 加速需求齒輪比

由馬達最大扭矩決定齒輪比：

$$
Z_a = \frac{M_w}{T_{motor\_max}}
$$

### 極速需求齒輪比
$$
\omega_w = \frac{v}{r_w}
$$

$$
RPM_w =
\frac{\omega_w \cdot 60}{2\pi}
$$

$$
Z_{ts} =
\frac{RPM_{motor\_max}}{RPM_w}
$$

### 綜合齒輪比

為兼顧 **加速與極速性能**，可取平均值：

$$
Z_{avg} =
\frac{Z_a + Z_{ts}}{2}
$$
