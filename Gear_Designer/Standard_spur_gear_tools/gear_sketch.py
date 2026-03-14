import matplotlib.pyplot as plt #匯入繪圖模組
import numpy as np 
import gear_specification as gs

def involutetheta (R,r): #漸開線角度
    phi = ((R/r)**2-1)**(1/2)
    theta = np.arctan((np.tan(phi)-phi)/(1+np.tan(phi)))
    return (theta)


# 定義參數與基本計算============================

V = 10#視野範圍
T = 60
M = 1
A = 5

pa = gs.pitch_angle(T)#周節角
hpa = gs.halfpitch_angle(T)#周節半角
Rt = gs.tip_radius(M,T)#齒頂圓半徑
Rp = gs.pitch_radius(M,T)#節圓半徑
Rb = gs.base_radius(M,T)#基圓半徑
Rr = gs.root_radius(M,T)#齒根圓半徑

a2= involutetheta(Rp,Rb)  #漸開線角度 - 基圓 to 節圓
a3= involutetheta(Rt,Rb)-(a2)#漸開線角度 - 節圓 to 齒頂圓
a1 = hpa-2*a2 #底部角度
a4 = hpa-2*a3 #頂部角度

# 繪圖函式============================
def line_1 (rb,rr,t):
    i = 0
    if rb < rr:
        pass
    else: 
        while i <= t:
            L = np.linspace(rr,rb)
            theta = L*0
            plt.polar(theta+pa*i, L , V , color = "green" ) # 極座標畫徑向直線
            i = i + 1
        
def line_2 (rb,rr,t):
    i = 0
    if rb < rr:
        pass
    else:
        while i <= t:
            L = np.linspace(rr,rb)
            theta = L*0+a1
            plt.polar(theta+pa*i, L , V , color = "green" ) # 極座標畫徑向直線
            i = i + 1

def involute_1 (rt,rb,rr,t):
    i = 0
    if rb < rr:
        while i <= t:
            R = np.linspace(rt,rr)#
            theta = -involutetheta(R,rb)#
            plt.polar(theta+pa*i, R , V , color = "blue" ) # 極座標畫漸開線1
            i = i + 1      
    else:
        while i <= t:
            R = np.linspace(rt,rb)
            theta = -involutetheta(R,rb)
            plt.polar(theta+pa*i, R , V , color = "blue" ) # 極座標畫漸開線1
            i = i + 1

def involute_2 (rt,rb,rr,t):
    i = 0
    if rb < rr:
        while i <= t:
            R = np.linspace(rr,rt)#
            theta = involutetheta(R,rb)+a1#
            plt.polar(theta+pa*i, R , V , color = "blue" ) # 極座標畫漸開線2
            i = i + 1    
    else:
        while i <= t:
            R = np.linspace(rb,rt)
            theta = involutetheta(R,rb)+a1
            plt.polar(theta+pa*i, R , V , color = "blue" ) # 極座標畫漸開線2
            i = i + 1

def topland (r,t):
    i = 0
    while i <= t:
        theta = np.linspace(a1+a2+a3,a1+a2+a3+a4)
        R = theta*0+r
        plt.polar(theta+pa*i, R , V , color = "red" )  # 極座標畫內徑
        i = i + 1

def bottomland (r,t):
    i = 0
    while i <= t:
        theta = np.linspace(0,a1)
        R = theta*0+r
        plt.polar(theta+pa*i, R , V , color = "red" )  # 極座標畫內徑
        i = i + 1

def hole (A):
    r = A/2
    theta = np.linspace(0,np.pi*2)
    R = r+theta*0
    plt.polar(theta, R , V , color="red")  # 極座標畫軸孔
    
#=======================================================(圖像產生)

if __name__ == "__main__":
    fig = plt.figure(linewidth=1, figsize=(5,5)) #新建畫布(單位吋)
    plt.subplot(polar = True)

    bottomland (Rr,T)

    involute_1 (Rt,Rb,Rr,T)
    involute_2 (Rt,Rb,Rr,T)

    topland (Rt,T)
    line_1 (Rb,Rr,T)
    line_2 (Rb,Rr,T)
    hole (A)

    plt.axis('off')
    plt.grid(True)#網格
    plt.show()#顯示圖表