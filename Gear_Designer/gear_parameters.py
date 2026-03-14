import numpy as np #匯入數學

'''
M = 1#模數(單位:mm)>0
T = 20#齒數>2
a = 1#齒頂倍率>0
d = 1.25#齒根倍率>0
s = 1#齒間倍率<2,>0
ap = 20#壓力角(單位:度)
f = 0.236#齒根圓角半徑倍率>0
'''


def pitch_diameter(M,T):#節圓直徑(模數,齒數)
    D = M*T
    return(D)

def pitch_radius(M,T):#節圓半徑(模數,齒數)
    R = pitch_diameter(M,T)/2
    return(R)

def pitch_circumference(M,T):#節圓周長(模數,齒數)
    C = pitch_diameter(M,T)*np.pi
    return(C)

def pitch(M):#周節(模數)
    P = M*np.pi
    return(P)

def Diametral_pitch(M):#徑節(模數)
    Dp = 2.54/M
    return(Dp)

def pitch_radian (T):#周節徑度(齒數)
    rp = 2*np.pi/T
    return(rp)

def Addendum (M,a):#齒頂(模數,齒頂倍率)
    add = M*a
    return(add)

def tip_diameter (M,T,a):#齒頂圓半直徑(模數,齒數,齒頂倍率)
    Dt = (T+2*a)*M
    return(Dt)

def tip_radius (M,T,a):#齒頂圓半徑(模數,齒數,齒頂倍率)
    Rt = tip_diameter (M,T,a)/2
    return(Rt)

def tip_circumference(M,T,a):#齒頂圓周長(模數,齒數,齒頂倍率)
    Ct = tip_diameter (M,T,a)*np.pi
    return(Ct)

def working_depth (M,a):#工作深度(模數,齒頂倍率)
    Wd = M*a*2
    return(Wd)

def Dedendum (M,d):#齒根(模數,齒根倍率)
    Ded = d*M
    return(Ded)

def root_diameter (M,T,d):#齒根圓直徑(模數,齒數,齒根倍率)
    Dr = M*(T-2*d)
    return(Dr)

def root_radius (M,T,d):#齒根圓半徑(模數,齒數,齒根倍率)
    Rr = root_diameter(M,T,d)/2
    return(Rr)

def root_circumference (M,T,d):#齒根圓周長(模數,齒數,齒根倍率)
    Cr = root_diameter(M,T,d)*np.pi
    return(Cr)

def tooth_height (M,a,d):#齒高(模數,齒頂倍率,齒根倍率)
    h = (a+d)*M
    return(h)

def clearance (M,a,d):#齒輪間隙(模數,齒頂倍率,齒根倍率)不是齒隙
    c = M*abs(a-d)
    return(c)

def tooth_thickness(M,s):#齒厚(模數,齒間倍率)
    tt = pitch(M)*(2-s)/2
    return(tt)

def tooth_space(M,s):#齒間(模數,齒間倍率)
    ts = pitch (M)*s/2
    return(ts)

def thickness_radian(M,T,s):#齒厚徑度(模數,齒數,齒間倍率)
    rt = tooth_thickness(M,s)/pitch_radius(M,T)
    return(rt)

def space_radian(M,T,s):#齒間徑度(模數,齒數,齒間倍率)
    rs = tooth_space(M,s)/pitch_radius(M,T)
    return(rs)

def pressure_radian (ap):#壓力角徑度(壓力角)
    rp = np.pi/(180/ap)
    return(rp)

def base_diameter (M,T,ap):#基圓直徑(模數,齒數,壓力角)
    Db =  pitch_diameter(M,T)*np.cos(pressure_radian(ap))
    return(Db)

def base_radius (M,T,ap):#基圓半徑(模數,齒數,壓力角)
    Rb = base_diameter (M,T,ap)/2
    return(Rb)

def base_circumference(M,T,ap):#基圓周長(模數,齒數,壓力角)
    Cb = base_diameter (M,T,ap)*np.pi
    return(Cb)

def fillet(M,f):#齒根圓角半徑(模數,齒根圓角倍率)
    F = f*M
    return(F)