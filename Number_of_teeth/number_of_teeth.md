# 行星齒輪齒數組合搜尋程式說明 (Planetary Gear Tooth Combination Search)
* [齒數組合配合條件](Number_of_teeth.m)

本文件說明 MATLAB 程式 **齒數組合計算腳本** 的設計目的與計算流程。  
程式主要用途為 **自動搜尋符合條件的行星齒輪組合**，適用於：

- 兩層行星齒輪 (Compound Planetary Gear)
- 指定最大外徑
- 指定最小齒數
- 指定最小減速比

程式會遍歷所有可能齒數組合，並依序檢查多個設計限制，最後輸出所有 **符合條件的齒數配置**。


## 3 齒數搜尋範圍
由最大齒輪直徑與模數，可估算最大齒數：

$$
T_{all} = \left( \frac{D_{max}}{M} \right)
$$

| 齒輪類型 | 最小齒數 | 最大齒數 |
|---|---|---|
| 太陽輪 | $T_s^{min} = T_{min}$ | $T_s^{max} = T_{all} - 2T_{min}$ |
| 第一層行星齒 | $T_{p1}^{min} = T_{min}$ | $T_{p1}^{max} = \frac{T_{all} - T_{min}}{2}$ |
| 第二層行星齒 | $T_{p2}^{min} = T_{min}$ | $T_{p2}^{max} = T_{p1}^{max}$ |
| 環齒輪 | $T_r^{min} = 3T_{min}$ | $T_r^{max} = T_{all}$ |

總組合數量為：

$$
N =
|T_s| \cdot |T_r| \cdot |T_{p1}| \cdot |T_{p2}|
$$

## 2 各項限制條件
### 尺寸限制 (Size Constraint)
確保齒輪尺寸不超出最大直徑限制。

$$
2T_{p1} + T_s \leq T_{all}
$$


### 幾何限制 (Geometry Constraint)
此條件確保齒輪能正確嚙合。

$$
T_s + T_{p1} + T_{p2} = T_r
$$


### 最大公因數
程式計算兩層行星齒輪的最大公因數，
$gcd$ 為最大公因數函數。

$$
P = gcd(T_{p1}, T_{p2})
$$



### 相位限制 (Phase Constraint)

為了確保多顆行星齒輪可以 **均勻排列**，  需要滿足相位條件。

$$
K =
\frac{T_s T_{p2} - T_r T_{p1}}{3P}
$$

$$
K \in \mathbb{Z}
$$

$$
K \text{ 為整數}
$$

$$
mod(K,1) = 0
$$

### 週期限制 (Periodicity Constraint)

為避免齒輪週期過短造成磨損集中，此條件可提高齒輪嚙合週期。

$$
P \ne 1
$$

$$
gcd(T_{p1},T_{p2}) \ne 1
$$



---

### 減速比限制 (Gear Ratio Constraint)

兩層行星齒輪減速比：

$$
z_1 = \frac{T_{p1}}{T_s}
$$

$$
z_2 = \frac{T_r}{T_{p2}}
$$

$$
z_{all} = z_1 z_2
$$

$$
z_{all} > z
$$
