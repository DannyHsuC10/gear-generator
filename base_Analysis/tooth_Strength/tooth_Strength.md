# 齒輪強度簡化評估 (Simple Gear Strength Estimation)
* [檔案位置](tooth_Strength.m)

此模型為**簡化齒輪強度模型**，假設：

1. 齒輪齒根為矩形截面
2. 主要受剪應力控制
3. 不考慮齒面接觸應力
4. 不考慮疲勞壽命
5. 不考慮齒形修正

因此結果主要用於：

**齒輪尺寸設計的初步估算 (first-order sizing)**。

## 1. 齒輪幾何關係
### 半徑 
$$
D = T M
$$

- $T$ ：齒數  
- $M$ ：模數  

$$
R = \frac{D}{2} = \frac{TM}{2}
$$
### 有效面積
齒輪齒根直線切面為矩形截面，其有效受力面積為

$$
P = \frac{\pi D}{T}
$$

$$
P = \pi M
$$

$$
A = \frac{P \cdot h}{2}
$$

- $h$ ：齒高
## 2. 齒輪受力
齒輪接觸處的切向力為

$$
V = \frac{M_{motor}\cdot e}{R}
$$

$$
V = \frac{M_{motor}\cdot e}{TM/2}
$$

假設齒輪受力近似為矩形剪力問題，最大剪應力：

$$
\tau_{max} = \frac{3V}{2A}
$$

$$
\tau_{allow} = \frac{\tau_{max}}{SF}
$$
---
強度公式整理

$$
\frac{\tau_{max}}{SF}
=
\frac{3(M_{motor}\cdot e/R)}{P\cdot h}
$$

$$
R = TM/2
$$

$$
\frac{\tau_{max}}{SF}
=
\frac{3(M_{motor}\cdot e)}{T\cdot M\cdot P\cdot h/2}
$$

$$
P = \frac{\pi D}{T}
$$

$$
\frac{\tau_{max}}{SF}
=
\frac{3(M_{motor}\cdot e)}{T\cdot M\cdot (\pi D/T)\cdot h/2}
$$

$$
D = TM
$$

$$
\frac{\tau_{max}}{SF}
=
\frac{6(M_{motor}\cdot e)}{T\cdot M^2\cdot \pi\cdot h}
$$

$$
M^2
=
\frac{6(M_{motor}\cdot e\cdot SF)}
{T\cdot\pi\cdot h\cdot\tau_{max}}
$$

$$
M =
\sqrt{
\frac{6(M_{motor}\cdot e\cdot SF)}
{T\cdot\pi\cdot h\cdot\tau_{max}}
}
$$
代表：**滿足強度要求的最小模數**

## ３. 實際使用模數

實際設計模數需同時滿足：

1. 強度限制
2. 加工限制

$$
M_{target} =
\max(M_1, M_2)
$$

齒數轉折點
$$
M_1 > M_2
$$

代表：**強度開始主導設計**

* 小齒數時 → 強度需求較大
* 大齒數時 → 加工精度主導
