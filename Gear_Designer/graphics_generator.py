import matplotlib.pyplot as plt
import numpy as np
from Gear_Designer import gear_parameters as gp
from Gear_Designer import data

V = 1

def involutetheta(R, r):
    phi = ((R/r)**2 - 1)**(1/2)
    theta = np.arctan((np.tan(phi) - phi) / (1 + np.tan(phi)))
    return theta

class gear_animate:
    def __init__(g, M, T, a, d, s, ap, A):
        g.T = T
        g.rp = gp.pitch_radian(T)
        g.rs = gp.space_radian(M, T, s)
        g.rt = gp.thickness_radian(M, T, s)
        g.Rt = gp.tip_radius(M, T, a)
        g.R = gp.pitch_radius(M, T)
        g.Rb = gp.base_radius(M, T, ap)
        g.Rr = gp.root_radius(M, T, d)
        g.r2 = involutetheta(g.R, g.Rb)
        g.r3 = involutetheta(g.Rt, g.Rb) - g.r2
        g.r1 = g.rs - 2 * g.r2
        g.r4 = g.rt - 2 * g.r3
        g.Ra = A / 2

    def line(g, theta_offset):
        i = 0
        while i < g.T:
            L = np.linspace(g.Rr, g.Rb)
            theta = L * 0 + theta_offset
            plt.polar(theta + g.rp * i, L, color='green', linewidth=V)
            theta = L * 0 + g.r1 + theta_offset
            plt.polar(theta + g.rp * i, L, color='green', linewidth=V)
            i += 1

    def involute(g, theta_offset):
        i = 0
        while i < g.T:
            R = np.linspace(g.Rt, g.Rb)
            theta = -involutetheta(R, g.Rb) + theta_offset
            plt.polar(theta + g.rp * i, R, color='blue', linewidth=V)
            theta = involutetheta(R, g.Rb) + g.r1 + theta_offset
            plt.polar(theta + g.rp * i, R, color='blue', linewidth=V)
            i += 1

    def topland(g, theta_offset):
        i = 0
        while i < g.T:
            theta = np.linspace(g.r1 + g.r2 + g.r3, g.r1 + g.r2 + g.r3 + g.r4) + theta_offset
            R = theta * 0 + g.Rt
            plt.polar(theta + g.rp * i, R, color='red', linewidth=V)
            i += 1

    def bottomland(g, theta_offset):
        i = 0
        while i < g.T:
            theta = np.linspace(0, g.r1) + theta_offset
            R = theta * 0 + g.Rr
            plt.polar(theta + g.rp * i, R, color='red', linewidth=V)
            i += 1

    def hole(g):
        theta = np.linspace(0, np.pi * 2)
        R = g.Ra + theta * 0
        plt.polar(theta, R, color="red", linewidth=V)

def animate(frame):
    plt.clf()  # 清除當前圖形
    T = data.get_value(2,2)
    M = data.get_value(3,2)
    a = data.get_value(2,4)
    d = data.get_value(2,6)
    s = data.get_value(2,8)
    ap = data.get_value(2,10)
    A = data.get_value(2,20)
    sketch = gear_animate(M, T, a, d, s, ap, A)
    theta_offset = frame / 10.0
    sketch.bottomland(theta_offset)
    sketch.hole()
    sketch.involute(theta_offset)
    sketch.line(theta_offset)
    sketch.topland(theta_offset)

class gear_sketch:
    def __init__(g, M, T, a, d, s, ap, A):
        g.T = int(T)
        g.rp = gp.pitch_radian(T)
        g.rs = gp.space_radian(M, T, s)
        g.rt = gp.thickness_radian(M, T, s)
        g.Rt = gp.tip_radius(M, T, a)
        g.R = gp.pitch_radius(M, T)
        g.Rb = gp.base_radius(M, T, ap)
        g.Rr = gp.root_radius(M, T, d)
        g.r2 = involutetheta(g.R, g.Rb)
        g.r3 = involutetheta(g.Rt, g.Rb) - g.r2
        g.r1 = g.rs - 2 * g.r2
        g.r4 = g.rt - 2 * g.r3
        g.Ra = A / 2

    def plot_line(g):
        if g.Rb >= g.Rr:
            for i in range(g.T + 1):
                L = np.linspace(g.Rr, g.Rb)
                plt.polar(L*0 + g.rp*i, L, color="green", linewidth=V)
                plt.polar(L*0 + g.r1 + g.rp*i, L, color="green", linewidth=V)

    def plot_involute(g):
        for i in range(g.T + 1):
            R = np.linspace(g.Rt, g.Rb if g.Rb >= g.Rr else g.Rr)
            theta = involutetheta(R, g.Rb)
            plt.polar(-theta + g.rp*i, R, color="blue", linewidth=V)
            plt.polar(theta + g.r1 + g.rp*i, R, color="blue", linewidth=V)

    def plot_topland(g):
        for i in range(g.T + 1):
            theta = np.linspace(g.r1 + g.r2 + g.r3, g.r1 + g.r2 + g.r3 + g.r4)
            plt.polar(theta + g.rp*i, np.full_like(theta, g.Rt), color="red", linewidth=V)

    def plot_bottomland(g):
        for i in range(g.T + 1):
            theta = np.linspace(0, g.r1)
            plt.polar(theta + g.rp*i, np.full_like(theta, g.Rr), color="red", linewidth=V)

    def plot_hole(g):
        theta = np.linspace(0, 2 * np.pi)
        plt.polar(theta, np.full_like(theta, g.Ra), color="red", linewidth=V)
        
def graphic():
    plt.clf()  # 清除當前圖形
    T = data.get_value(2,2)
    M = data.get_value(3,2)
    a = data.get_value(2,4)
    d = data.get_value(2,6)
    s = data.get_value(2,8)
    ap = data.get_value(2,10)
    A = data.get_value(2,20)
    sketch = gear_sketch(M, T, a, d, s, ap, A)
    sketch.plot_bottomland()
    sketch.plot_hole()
    sketch.plot_involute()
    sketch.plot_line()
    sketch.plot_topland()
'''
# 創建動畫
fig, ax = plt.subplots(subplot_kw={'projection': 'polar'})
ani = animation.FuncAnimation(fig, animate, frames=np.arange(0, 300), interval=20, blit=False)

plt.show()
'''