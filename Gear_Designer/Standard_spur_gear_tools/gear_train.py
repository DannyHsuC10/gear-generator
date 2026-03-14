#e = speed_out/speed_in
#R = Teeth_in/Teeth_out

def train_value (Ni,Nf):#計算輪系值(輸入轉速,輸出轉速)
    e = Nf/Ni
    return(e)

def compound_train_value (Ni,Nf):
    e = 1
    if len(Ni) != len(Nf):
        print('資訊數量錯誤')
        return None
    else:
        n = len(Ni)
        for i in range (n):
            e = e*train_value(Ni[i],Nf[i])
            i = i+1
    return(e)
    
def fixed_speed_ratio (N1,N2):#絕對速比計算齒輪比>>固定輪系用輪1:輪2(轉速1,轉速2)
    R= N2/N1
    return(R)

def Epicyclic_speed_ratio (N1,N2,Nc):#相對速比計算輪系值>>周轉輪系用輪1:輪2()
    R = (N2-Nc)/(N1-Nc)
    return(R)

def simple_gear_ratio (T1,T2):  #計算單式輪系齒輪比>>輪1:輪2(齒數1,齒數2)
    R = T1/T2
    return(R)

def compound_gear_ratio (T1,T2):#計算複式輪系齒輪比>>輪1:輪2(所有齒輪齒數串列1,所有齒輪齒數串列2)
    R = 1
    if len(T1) != len(T2):
        print('齒輪數量資訊錯誤')
        return None
    else:
        n = len(T1)
        for i in range (n):
            R = R*simple_gear_ratio(T1[i],T2[i])
            i = i+1
    return(R)


'''
a = 10
b = 20
g1 = [10,20,10,20,10,20]
g2 = [20,40,20,40,20,40]

print( compound_train_value(g1,g2))
'''