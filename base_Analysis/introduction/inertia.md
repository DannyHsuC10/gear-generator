# inertia
* [檔案位置](../Rotational_inertia.m)
## 轉動慣量計算
$$m = DV = DhA$$
### 圓環
$$I = mr^2$$
### 圓柱
$$I = \frac12mr^2$$
## 相對轉動慣量
* $I$ : 原始轉動慣量
* $I'$ : 相對轉動慣量(車輪端)

$$e = \frac{\omega_i}{\omega_o}$$

$$\tau' = \tau\cdot e$$

$$I'(\alpha/ e) = I\alpha\cdot e$$

$$I' = Ie^2$$

## 轉動慣量與轉速關係
### 轉速

* 內齒輪 & 車輪 & hub : $\omega_w$
* 行星齒輪 : $\omega_w/e_2$
* 太陽齒輪 & AMK馬達 : $\omega_w/(e_2e_1)$

### 轉動慣量
* 內齒輪 & 車輪 & hub : $I_w$
* 行星齒輪 : $I_pe_2^2$
* 太陽齒輪 & AMK馬達 : $I_m(e_2e_1)^2$

## 輪端慣性力
$$I = \sum I_i = I_w+nI_pe_2^2+I_m(e_2e_1)^2$$

$$\tau = I\alpha$$

$$F = \tau/r_w$$