import tkinter as tk
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
import matplotlib.pyplot as plt
import numpy as np
import matplotlib.animation as animation
from Gear_Designer import data
from Gear_Designer import graphics_generator as gg
import ctypes

ctypes.windll.shcore.SetProcessDpiAwareness(0)
floatnumber = 4

def reset():
    M, T, a, d, s, ap, f = 1, 20, 1, 1.25, 1, 20, 0.236
    data.table(M, T, a, d, s, ap, f, floatnumber)

def hide_entry2():
    entry2.place_forget()
    entry2_Label.config(text=' ')

def show_entry2():
    entry2.place(x=first, y=60)
    entry2_Label.config(text='輸入齒輪模數:')

def show_data(n):
    in_data = data.get_data(n, 2, 3)
    in_text = "\n".join([f"{in_data[i]} {in_data[i+1]}" for i in range(0, len(in_data), 2)])
    in_data_label.config(text=in_text)
    
    out_data = data.get_data(n, 5, 10)
    out_text = "\n".join([f"{out_data[i]} {out_data[i+1]}" for i in range(0, len(out_data), 2)])
    out_data_label.config(text=out_text)

def toggle_buttons():
    for btn in buttons:
        if btn.winfo_viewable():
            btn.place_forget()
            show_main()
        else:
            btn.place(x=second, y=150 + buttons.index(btn) * 30)

def confirm_main():
    T, M = int(entry1.get()), float(entry2.get())
    a, d, s, ap, f = [data.get_value(2, i) for i in range(4, 13, 2)]
    data.table(M, T, a, d, s, ap, f, floatnumber)
    show_data(1)

def show_main():
    show_data(1)
    entry1_Label.config(text='輸入齒輪齒數:')
    show_entry2()
    entry1.delete(0, tk.END)
    tk.Button(root, text="確定", command=confirm_main).place(x=first, y=confirm_y)

def show_Advanced(n):
    Label_name = ['輸入齒頂倍率:', '輸入齒根倍率:', '輸入齒間倍率:', '輸入壓力角度:', '輸入齒根圓角倍率:']
    
    def confirm():
        g = [data.get_value(3, 2), data.get_value(2, 2)] + [data.get_value(2, i) for i in range(4, 13, 2)] + [floatnumber]
        g[n + 2] = float(entry1.get())
        data.table(*g)
        show_data(n + 2)
    
    entry1.delete(0, tk.END)
    show_data(n + 2)
    entry1_Label.config(text=Label_name[n])
    hide_entry2()
    tk.Button(root, text="確定", command=confirm).place(x=first, y=confirm_y)

def show_gear():
    fig = plt.figure(linewidth=1, figsize=(5, 5))
    gg.graphic()
    canvas = FigureCanvasTkAgg(fig, master=root)
    canvas.draw()
    canvas.get_tk_widget().place(x=380, y=50)

def show_animate():
    # 隱藏動畫按鈕
    btn_animation.place_forget()

    fig = plt.figure(linewidth=1, figsize=(2.2, 2.2))
    ani = animation.FuncAnimation(fig, gg.animate, frames=np.arange(0, 500), interval=1, blit=False)
    canvas = FigureCanvasTkAgg(fig, master=root)
    canvas.draw()
    widget = canvas.get_tk_widget()
    widget.place(x=50, y=350)

    def stop_animation():
        ani.event_source.stop()   # 停止動畫
        widget.destroy()          # 移除畫布
        # 恢復動畫按鈕
        btn_animation.place(x=700, y=10)

    # 5 秒後停止動畫並恢復按鈕
    root.after(5000, stop_animation)


# ===========================================================================
# 初始化Tkinter主窗口
root = tk.Tk()
root.title("齒輪計算工具")
root.geometry('1000x600')
root.resizable(False, False)

# 初始化變量
first, second, confirm_y = 50, 200, 90

# 重新設定初始值
reset()

# 創建畫布
canvas = tk.Canvas(root, width=1000, height=600)
canvas.pack()
canvas.create_line(300, 0, 300, 600, fill="gray", width=2)
canvas.create_line(50, 200, 150, 200, fill="gray", width=2)
canvas.create_line(50, 320, 250, 320, fill="gray", width=2)

# 設置按鈕
tk.Button(root, text="1.主要參數設定", command=show_main).place(x=first, y=120)
tk.Button(root, text="確定", command=confirm_main).place(x=first, y=confirm_y)

button_name = ["2.齒頂進階設定", "3.齒根進階設定", "4.齒間進階設定", "5.壓力角度調整", "6.圓角參數調整"]
buttons = [tk.Button(root, text=button_name[i], command=lambda i=i: show_Advanced(i)) for i in range(5)]
for btn in buttons:
    btn.place_forget()

tk.Button(root, text="進階設定", command=toggle_buttons).place(x=second, y=120)

# 添加齒輪草圖按鈕
tk.Button(root, text="齒輪草圖", command=show_gear).place(x=600, y=10)
tk.Button(root, text="齒輪草圖", command=show_gear).place(x=600, y=10)

# 把動畫按鈕存成變數，方便控制
btn_animation = tk.Button(root, text="動畫", command=show_animate)
btn_animation.place(x=700, y=10)


# 設置輸入框和標籤
entry1_Label = tk.Label(root, text='輸入齒輪齒數:')
entry1_Label.place(x=first, y=0)
entry2_Label = tk.Label(root, text='輸入齒輪模數:')
entry2_Label.place(x=first, y=40)

entry1 = tk.Entry(root)
entry1.place(x=first, y=20)
entry2 = tk.Entry(root)
show_entry2()

# 顯示數據
in_data_label = tk.Label(root, anchor="w", justify="left")
in_data_label.place(x=first, y=160)
out_data_label = tk.Label(root, anchor="w", justify="left")
out_data_label.place(x=first, y=210)
show_data(1)

# 顯示齒輪圖像
show_gear()

root.mainloop()
