import matplotlib.pyplot as plt #匯入繪圖模組
import math #匯入數學模組
import numpy as np #匯入數學模組
#===================================================================(從齒數和模數推算半徑和角度)

T = 90
M = 1
rh = 5
N = 100#50

def involutetheta (R,r): #漸開線
    phi = ((R/r)**2-1)**(1/2)
    theta = np.arctan((np.tan(phi)-phi)/(1+np.tan(phi)))
    return (theta)

theta0 = 2*np.pi/T #周節
halftheta0 = theta0/2 #齒寬或齒間

r1 = (T-2.5)*M #齒根圓半徑
r2 = T*M*np.cos(np.pi/9) #基圓半徑
r3 = T*M #節圓半徑
r4 = (T+2)*M #齒頂圓半徑

theta2 = involutetheta(r3,r2)  #漸開線角度 - 基圓 to 節圓
theta3 = involutetheta(r4,r2)-(theta2)#漸開線角度 - 節圓 to 齒頂圓
theta1 = halftheta0-2*theta2 #底部角度
theta4 = halftheta0-2*theta3 #頂部角度

#===================================================================(建立齒型的極座標方程式)

#fig = plt.figure() #新建畫布
def involute1painter (R,r,t):
    i = 0
    while i <= t:
        Rinvolute1 = np.linspace(R,r)
        thetainvolute1 = -involutetheta(Rinvolute1,r)
        plt.polar(thetainvolute1+theta0*i, Rinvolute1 , N , color = "blue" ) # 極座標畫漸開線1
        i = i + 1

def line1painter (R,r,t):
    i = 0
    while i <= t:
        L1 = np.linspace(r,R)
        thetaline1 = L1*0
        plt.polar(thetaline1+theta0*i, L1 , N , color = "green" ) # 極座標畫徑向直線
        i = i + 1
def bottomlandpainter (r,t):
    i = 0
    while i <= t:
        thetabottomland = np.linspace(0,theta1)
        R = thetabottomland*0+r
        plt.polar(thetabottomland+theta0*i, R , N , color = "red" )  # 極座標畫內徑
        i = i + 1

def line2painter (R,r,t):
    i = 0
    while i <= t:
        L2 = np.linspace(r,R)
        thetaline2 = L2*0+theta1
        plt.polar(thetaline2+theta0*i, L2 , N , color = "green" ) # 極座標畫徑向直線
        i = i + 1

def involute2painter (R,r,t):
    i = 0
    while i <= t:
        Rinvolute2 = np.linspace(r,R)
        thetainvolute2 = involutetheta(Rinvolute2,r)+theta1
        plt.polar(thetainvolute2+theta0*i, Rinvolute2 , N , color = "blue" ) # 極座標畫漸開線1
        i = i + 1
def toplandpainter (r,t):
    i = 0
    while i <= t:
        thetatopland = np.linspace(theta1+theta2+theta3,theta1+theta2+theta3+theta4)
        R = thetatopland*0+r
        plt.polar(thetatopland+theta0*i, R , N , color = "red" )  # 極座標畫內徑
        i = i + 1

def hole (r):
    thetahole = np.linspace(0,np.pi*2)
    rhole = r+thetahole*0
    plt.polar(thetahole, rhole, N, color="red")  # 極座標畫軸孔
#===================================================================(產生圖像)


#rho = np.arange(0,5)

#plt.subplot(polar = Ture)
print(T,M,theta0,halftheta0,halftheta0,r1,r2,r3,r4,theta1,theta2,theta3,theta4,0.236*M,sep=",")


involute1painter (r4,r2,T)
line1painter (r2,r1,T)
bottomlandpainter (r1,T)
line2painter (r2,r1,T)
involute2painter (r4,r2,T)
toplandpainter (r4,T)
hole (rh)
plt.axis('off')
plt.show()
