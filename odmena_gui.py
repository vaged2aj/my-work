# odměna advokáta v gui, nefunkční
import os
import sys
import math
import time
import locale
from tkinter import *
from math import *
##povoden = 0
##ustomez = 0
##odm_1u = 0
##pu = 0
##pu2=0
##pu5=0
##sp = 0
##vet = 's'
##komplikace = False
##cest = 0
##ztrat = 0
##ost = 0
##tarif = 0
##viceukony = False
##p = 300 #hodnota pausalu
##sazba = 0.21 # dph sazba
l = locale.setlocale(locale.LC_ALL, '')



#print("Vyúčtování -- program\n")

#---------------------------------------------------------------------------------------
# funkce
     
def Kc(x):
    'vrati z hodnoty formatovane Kc'
    l = locale.setlocale(locale.LC_ALL, '')
    return locale.currency(x, grouping=True)     


def tarif_f(x):
    'spocita vysy odmeny z tarifni hodnoty'
    if x <= 500:
        return 300 # 1
    elif x <= 1000: #2
        return 500
    elif x <=5000: #3
        return 1000
    elif x <=10000: #4
        return 1500
    elif x <= 200000: #5
       return 1500+math.ceil((x-10000)/1000)*40
    elif x <= 10000000: #6
        return 9100+math.ceil((x-200000)/10000)*40
    elif x > 10000000: #7
        return 48300+math.ceil((x-10000000)/100000)*40

def soudnipopl(x,y=False):
        'y False neni epr, jinak ano, x zaklad SP, spocita sop z tar hodn'
        if y == True:
                if x <= 10000:
                        return 400
                elif x <= 20000:
                        return 800
                else:
                        return int(round(0.04*math.ceil(x/10)*10,0))
        else:
                if x <= 2000:
                        return 1000
                else:
                        return int(round(0.05*math.ceil(x/10)*10,0))
    
def test():
    'vrati Bool zda byly na dotaz zda byly komplikace'
    test = input("Komplikace? [1 = ano] [cokoliv jineho = ne] ")
    if test == "1":
        return True

def zadej_tar_hodnotu():
    'Input tarifni hodnoty, int'
    while True:
        thodnota = ((input("Zadej tarifní hodnotu v Kč: "))) 
        try:
            return int(thodnota)
            break
        except ValueError:
            print("Zadej cele cislo")

def viceukony_ano():
    'dotaz na viceukony, vrati True'
    vet = input("Byly nějaké 2*úkony a 0.5*úkony [1 = ano][ostatni = ne] ")
    if vet == "1":
            return True
def pocet_ukonu():
    while True:
        abc = ((input("Zadej počet úkonů právní služby: "))) 
        try:
            pu = int(abc)
            return pu
            break
        except ValueError:
            print("Zadej celé číslo")
 

def zadej_viceukony():
    'zada pocet 1,2 a pulukonu, vrati tuple u,2u,5u'
    while True:
        abc = ((input("Zadej počet 1*úkonů právní služby: "))) 
        try:
            pu = int(abc)
            break
        except ValueError:
            print("Zadej celé číslo")
    while true:
            abc = ((input("zadej počet 2*úkonů právní služby: "))) 
            try:
                    pu2 = int(abc)
                    break
            except valueerror:
                    print("zadej celé číslo")
    while true:
            abc = ((input("zadej počet 0.5*úkonů právní služby: "))) 
            try:
                    pu5 = int(abc)
                    break
            except valueerror:
                    print("zadej celé číslo")

    return (pu,pu2,pu5)


def byl_sop():
    'vrati hodnotu Bool na dotaz byl sop'
    termun = input("Byl soudní poplatek? [1 = ano] [ostatni = ne] ")
    if termun == "1":
        return True
    else:
        return False

def vyse_sop(tarif):
    'dotaz na vypocet sopu, bere tarif jako vstup, vrati sop'
    sodo = input("Z tarifní hodnoty nebo ostatní? [1 = EPR], [2 = PR], [ostatni = jiny] ")
    if sodo == "1":
            return soudnipopl(tarif,True)
    elif sodo == "2":
            return soudnipopl(tarif)
    else:
        while True:
            abc = ((input("Zadej soudní poplatek v Kč: "))) 
            try:
                    return int(abc)
                    break
            except ValueError:
                    print("Zadej celé číslo")

def ostatni_n():
    'vrati ostatni naklady int'
    while True:
        abc = ((input("Zadej ostatní náklady bez DPH: [enter = 0] "))) 
        if abc == '':
            return 0
        else:
            try:
                    return int(abc)
                    break
            except ValueError:
                    print("Zadej celé číslo")

def kraceni(tarif):
    'upravi tarif podle dotazu na kraceni,bere tarif jako vstup'
    alpha = input("Krácení hodnoty odměny podle § 12a AT? [1 = ano] [ostatni = ne] ")               
    if alpha == "1":
            if 0.8*tarif_f(tarif) > 5000:
                    return 5000
            else:
                    return 0.8*tarif_f(tarif)
    else:
        return tarif_f(tarif)

def cest_ztrat():
    iota = input("Cestovné a ztrátový čas? [1 = ano] [cokoliv jineho = ne] ")
    if iota == "1":               
        while True:
                        beta = ((input("Zadej cestovné v Kč: "))) 
                        try:
                                #abc = int((input("Zadej tarifní hodnotu v Kč: "))) 
                                cest = int(beta)
                                break
                        except ValueError:
                                print("Zadej celé číslo")
        while True:
                gamma = ((input("Zadej ztrátový čas v 1/2h: "))) 
                try:
                        ztrat = 100*int(gamma)
                        break
                except ValueError:
                        print("Zadej celé číslo")
        return (cest,ztrat)
    else:
        return (0,0)

def dph(zaklad):
    return round(1.21 * zaklad,2)
def dph_cast(zaklad):
    return Kc(round(0.21 * zaklad,2))


def pausal(pocet):
     return pocet *300

def one_u(tarif,krac=False):
    if krac == True:
        if 0.8*tarif_f(tarif) > 5000:
            return 5000
        else:
                return 0.8*tarif_f(tarif)
    else:
        return tarif_f(tarif)

def odmena(tarif,pocet,krac=False):
    return one_u(tarif,krac)*pocet

def zaklad(tarif,pocet,krac=False,cest=0,ztrat=0):
    return (one_u(tarif,krac)*pocet+pausal(pocet)+cest+ztrat)

def ostatni_dph(cest=0,ztrat=0):
    return cest+ztrat

def vcetnedph(tarif,pocet,krac=False,cest=0,ztrat=0):
    return dph(zaklad(tarif,pocet,krac,cest,ztrat))


#def kraceni_gui_zaklad(tarif,pocet,kraceni,cest=0,ztrat=0):
#    'upravi tarif podle dotazu na kraceni,bere tarif jako vstup,vystup zaklad'
#    if x == True:
#        if 0.8*tarif_f(tarif) > 5000:
#                return (5000,5000*pocet+cest+ztrat)
#        else:
#                return (0.8*tarif_f(tarif),0.8*tarif_f(tarif)*pocet+cest+ztrat)
#    else:
#        return (tarif_f(tarif), tarif_f(tarif)*pocet+cest+ztrat)

def celkem(tarif,pocet,krac=False,cest=0,ztrat=0,sp=0):
    return Kc(vcetnedph(tarif,pocet,krac,cest,ztrat)+sp)

def sop_epr(tarif):
    'dotaz na vypocet sopu, bere tarif jako vstup, vrati sop'
    return soudnipopl(tarif,True)

def sop_pr(tarif):
    'dotaz na vypocet sopu, bere tarif jako vstup, vrati sop'
    return soudnipopl(tarif)


#--------------------------------------------------------------------
###gui
from tkinter import *
import tkinter as tk
from tkinter.messagebox import *
okno = tk.Tk()
okno.title("Vyúčtování - program")
okno.geometry("700x800")

krac = tk.IntVar()
sop_druh = tk.IntVar()
pr = tk.IntVar()
epr = tk.IntVar()
komplikace = tk.IntVar()

def Buttons(x=0):
    Button(okno, text='Quit', command=okno.destroy).grid(row=0, column=0+x, sticky=W, pady=4)
    Button(okno, text='Show', command=show_answer).grid(row=0, column=1+x, sticky=W, pady=4)
    Button(okno, text='Clear', command=clear).grid(row=0, column=2+x, sticky=W, pady=4)
#    Button(okno, text='Test', command=komplik).grid(row=0, column=4+x, sticky=W, pady=4)
    komplikace_check = Checkbutton(okno, text="Komplikace", variable=komplikace,onvalue = True,offvalue = False)
    komplikace_check.grid(row=1, column=0+x, sticky=W, pady=4)
def komplikace_show():
    y = 2
    z = 2
    Label(okno, text = "Soudní poplatek").grid(row=1+y)
    Label(okno, text = "Krácení § 12a").grid(row=2+y)
    Label(okno, text = "Cestovné").grid(row=3+y)
    Label(okno, text = "Ztrátový čas").grid(row=4+y)

    SOP = Entry(okno,width=40)
    par_12a = Entry(okno,width=40)
    Cestovne = Entry(okno,width=40)
    Ztratovy_c = Entry(okno,width=40)
    
    SOP.grid(row=1+z, column=1)
    par_12a.grid(row=2+z, column=1)
    Cestovne.grid(row=3+z, column=1)
    Ztratovy_c.grid(row=4+z, column=1)
#    textbox = Text()
#    textbox.grid(row=14+z,column=1)

    

def funkce_print(tarif,pu):
    odm = tarif_f(tarif)*pu
    odm_1u = tarif_f(tarif)
    
    return str(odm),' tj'
##            f"{'odměna':<20}{Kc(odm):>15}{','}",
##            f"{'tj. '}{pu}{' x '}{int(odm_1u)}{' Kč'}",
##            )    
    

def show_answer():
    tarif = int(tarifni_hodnota.get())
    pu =  int(pocet_ukonu.get())
    zkr = False
    sp = 0
    cest = int(Cestovne.get())
    ztrat = 100*int(Ztratovy_c.get())
    if komplikace.get() == True:
        cest = int(Cestovne.get())
        ztrat = 100*int(Ztratovy_c.get())
        
    else:
        cest = 0
        ztrat = 0
    if krac.get() == True:
        zkr = True
    else:
        zkr = False
    if epr.get() == True:
        Soudni.insert(0,Kc(sop_epr(tarif)))
        sp = sop_epr(tarif)
    if sop_druh.get() == True:
        sp = int(Soudni.get())
    if pr.get() == True:
        Soudni.insert(0,Kc(sop_pr(tarif)))
        sp = sop_pr(tarif)
    celk = celkem(tarif,pu,zkr,cest,ztrat,sp) 
    Odm = odmena(tarif,pu,zkr)
    Odmena.insert(0,"%s, tj. %s x %s" %(Kc(Odm), pu, one_u(tarif,zkr)))
    Pausal.insert(0, "%s, tj. %s x 300" % (Kc(pausal(pu)),pu))
    Zaklad.insert(0, '%s' % Kc(zaklad(tarif,pu,zkr,cest,ztrat)))

    DPH.insert(0, dph_cast(zaklad(tarif,pu,zkr,cest,ztrat)))
    Vysledek.insert(0, celk)
    Test.insert(0, komplikace.get())
    
##    {'odměna':<20}{Kc(odm):>15}{','}
def clear():
    Odmena.delete(0,END)
    Pausal.delete(0,END)
    Zaklad.delete(0,END)
    DPH.delete(0,END)
    Soudni.delete(0,END)
    Vysledek.delete(0,END)
    
Buttons()

Texty = ["Zadej tarifní hodnotu","Zadej počet úkonů","Soudní poplatek","Cestovné","Krácení § 12a","Ztrátový čas v 1/2h","Odměna","Paušál","Základ","DPH","Celkem","Test"] 
Special = ["PR","EPR"]
def labels(Texty,r=0,c=0):
    a = 1   
    for i in Texty:
        Label(okno, text = i ).grid(row=a+1,column=0,sticky=E,pady=4)
        a += 1
labels(Texty)
def labels_special(Texty,r=0,c=0):
    a = 1   
    for i in Texty:
        Label(okno, text = i ).grid(row=4,column=2+a,sticky=E,pady=4)
        a += 1
labels_special(Special)

a = 2
b = 2
##Label(okno, text = "Zadej tarifní hodnotu").grid(row=a,column=0,sticky=E,pady=4)
##Label(okno, text = "Zadej počet úkonů").grid(row=a+1,column=0,sticky=E,pady=4)
##Label(okno, text = "Soudní poplatek").grid(row=a+2,column=0,sticky=E,pady=4)
##Label(okno, text = "EPR").grid(row=a+2,column=2,sticky=E,pady=10)
##Label(okno, text = "PR").grid(row=a+2,column=3,sticky=W,pady=10)
##Label(okno, text = "Krácení § 12a").grid(row=a+3,column=0,sticky=E,pady=4)
##Label(okno, text = "Cestovné").grid(row=a+4,column=0,sticky=E,pady=4)
##Label(okno, text = "Ztrátový čas v 1/2h").grid(row=a+5,column=0,sticky=E,pady=4)
##Label(okno, text = "Odměna").grid(row=a+6,column=0,sticky=E,pady=4)
##Label(okno, text = "Paušál").grid(row=7+a,column=0,sticky=E,pady=4)
##Label(okno, text = "Základ").grid(row=8+a,column=0,sticky=E,pady=4)
##Label(okno, text = "DPH").grid(row=9+a,column=0,sticky=E,pady=4)
##Label(okno, text = "Celkem").grid(row=10+a,column=0,sticky=E,pady=4)
##Label(okno, text = "Test").grid(row=11+a,column=0,sticky=E,pady=4)

promenne = ['tarifni_hodnota', 'pocet_ukonu']

def entries(promenne):    
    b = 2
    for  i in promenne:
         
        i = Entry(okno,width=20)
        i.grid(row=b, column=1, sticky=E)
        b +=1
        
#entries(promenne)

tarifni_hodnota = Entry(okno,text='30000', width=40)
pocet_ukonu = Entry(okno,text='2',width=40)
Odmena = Entry(okno,width=40)
Pausal = Entry(okno,width=40)
Zaklad = Entry(okno,width=40)
DPH = Entry(okno,width=40)
Vysledek = Entry(okno,width=40)
Soudni = Entry(okno,width=20)
EPR = Checkbutton(okno,variable=epr,onvalue = True,offvalue = False)
PR = Checkbutton(okno,variable=pr,onvalue = True,offvalue = False)
SOP = Checkbutton(okno,variable=sop_druh,onvalue = True,offvalue = False)
par_12a = Checkbutton(okno,variable=krac,onvalue = True,offvalue = False)
Cestovne = Entry(okno,width=40)
Ztratovy_c = Entry(okno,width=40)
Vysledek = Entry(okno,width=40)
#Test = Entry(okno,width=40)

tarifni_hodnota.grid(row=b, column=1, sticky=E)
pocet_ukonu.grid(row=b+1, column=1)
Soudni.grid(row=b+2, column=2,sticky=W)
EPR.grid(row=b+2, column=3,sticky=E)
PR.grid(row=b+2, column=2,sticky=E)
SOP.grid(row=b+2, column=1,sticky=W,pady=10)
par_12a.grid(row=b+3,column=1,sticky=W)
Cestovne.grid(row=b+3, column=1)
Ztratovy_c.grid(row=b+5, column=1)
Odmena.grid(row=b+6, column=1)
Pausal.grid(row=b+7, column=1)
Zaklad.grid(row=b+8, column=1)
DPH.grid(row=b+9, column=1)
Vysledek.grid(row=b+10, column=1)
#Test.grid(row=b+11, column=1)



#komplik(komplikace.get())
#Button(okno, text='Quit', command=okno.destroy).grid(row=7, column=0, sticky=W, pady=4)
#Button(okno, text='Show', command=show_answer).grid(row=7, column=1, sticky=W, pady=4)
#Button(okno, text='Clear', command=clear).grid(row=7, column=2, sticky=W, pady=4)
#Button(okno, text="Komplikace", command=komplikace_show).grid(row=12, column=0, sticky=W, pady=4)

okno.mainloop()




#------------------------------------------------------





#------------------------------------------------------


#-------------------------------------------------------------------------------------
# proceduralni cast


##if test() == True:
##    komplikace = True
##    tarif = zadej_tar_hodnotu()
##               
##                       
##if komplikace == True:
##    if viceukony_ano() == True: #zada viceukony 
##        viceukony = True
##        (pu,pu2,pu5) = zadej_viceukony()
##    else: # pro pripad kdyz jsou komplikace ale ne viceukony
##        pu = pocet_ukonu()
##        
##
##    if byl_sop() == True:
##        sp = vyse_sop(tarif)
##    
##    ost = ostatni_n() #dotaze se na ostatni naklady
##    odm_1u = kraceni(tarif) #dotaze se na kraceni podle 12a AT
##    (cest,ztrat) = cest_ztrat()#dotaze se na ztratovy cas a cest, ulozi
##
##else:
##    tarif = zadej_tar_hodnotu()
##    pu = pocet_ukonu() #zadej pocet ukonu v pripade ze nejsou komplikace
##    odm_1u = int(tarif_f(tarif))
#-------------------------------------------------------------------------------------
# vypocet 

##odm = int(odm_1u * pu + odm_1u * pu2 * 2 + odm_1u * pu5 *0.5) #odmena cely, dvoj, pul ukon
##cp = p * (pu + 2*pu2 + pu5) #celkovy pausal
##zaklad = odm + cp + ztrat + cest
##dph = round(sazba * zaklad,2)
##celkem = round(zaklad + dph + sp+ost,2)
##bezd = celkem - dph


#-------------------------------------------------------------------------------------
# funkce print

##
##def funkce_print(tarif,pu,zaklad,dph,celkem,bezd,odm_1u,odm,pu2=0,pu5=0,sp=0,ost=0,):
##    print("----------------------------------------------\n")
##    
##    print(
##        f"{'tarifní hodnota':<20}{Kc(int(tarif)):>15}",)
##    if pu2 > 0 or pu5 > 0:
##        print(    f"{'odměna':<20}{Kc(odm):>15}{', z toho '}{pu}{' x '}{odm_1u}{' '}{pu2}{' x '}{2*odm_1u}{' '}{pu5}{' x '}{int(0.5*odm_1u)}",)
##
##    else:
##            print(
##            f"{'odměna':<20}{Kc(odm):>15}{','}",
##            f"{'tj. '}{pu}{' x '}{int(odm_1u)}{' Kč'}",
##            )
##    print(
##    f"{'režijní paušál':<20}{Kc(cp):>15}{', tj. '}{pu+2*pu2+pu5}{' x 300 Kč'}",
##    )
##    if cest > 0:
##            print(
##                f"{'cestovné':<20}{Kc(cest):>15}",)
##    if ztrat > 0:
##            print(
##                f"{'ztrátový čas:':<20}{Kc(ztrat):>15}",)
##    print(
##        f"{'základ':<20}{Kc(zaklad):>15}",
##        f"\n{'DPH':<20}{Kc(dph):>15}",)
##    if sp > 0:
##            print(
##                f"{'soud. popl.':<20}{Kc(sp):>15}",)
##    if ost > 0:
##            print(
##                f"{'ostatní náklady':<20}{Kc(ost):>15}",)
##    print(
##        f"{'náhr. celkem s DPH':<20}{Kc(celkem):>15}",)
##    if sp > 0 or ost > 0:
##            print(
##                f"{'náhr. celkem bez DPH':<20}{Kc(bezd):>15}",)
##
##
##def funkce_print_tuple(tarif,pu):#,zaklad,dph,celkem,bezd,odm_1u,odm,pu2=0,pu5=0,sp=0,ost=0,):
##    ls = []
##    ls.append('----------------------------------------------')
##    ls.append(Kc(int(tarif)))
##    return ls
####    print(
####        f"{'tarifní hodnota':<20}{Kc(int(tarif)):>15}",)
####    if pu2 > 0 or pu5 > 0:
####        print(    f"{'odměna':<20}{Kc(odm):>15}{', z toho '}{pu}{' x '}{odm_1u}{' '}{pu2}{' x '}{2*odm_1u}{' '}{pu5}{' x '}{int(0.5*odm_1u)}",)
####
####    else:
####            print(
####            f"{'odměna':<20}{Kc(odm):>15}{','}",
####            f"{'tj. '}{pu}{' x '}{int(odm_1u)}{' Kč'}",
####            )
####    print(
####    f"{'režijní paušál':<20}{Kc(cp):>15}{', tj. '}{pu+2*pu2+pu5}{' x 300 Kč'}",
####    )
####    if cest > 0:
####            print(
####                f"{'cestovné':<20}{Kc(cest):>15}",)
####    if ztrat > 0:
####            print(
####                f"{'ztrátový čas:':<20}{Kc(ztrat):>15}",)
####    print(
####        f"{'základ':<20}{Kc(zaklad):>15}",
####        f"\n{'DPH':<20}{Kc(dph):>15}",)
####    if sp > 0:
####            print(
####                f"{'soud. popl.':<20}{Kc(sp):>15}",)
####    if ost > 0:
####            print(
####                f"{'ostatní náklady':<20}{Kc(ost):>15}",)
####    print(
####        f"{'náhr. celkem s DPH':<20}{Kc(celkem):>15}",)
####    if sp > 0 or ost > 0:
####            print(
####                f"{'náhr. celkem bez DPH':<20}{Kc(bezd):>15}",)
##
##
###-------------------------------------------------------------------------------------
### print
##
##
##    
##

##print("----------------------------------------------\n")
##
##
##
##
##print(
##    f"{'tarifní hodnota':<20}{Kc(int(tarif)):>15}",)
##
##print(
##    f"{'počet úkonů':<20}{pu+pu2+pu5:>15}",)
##
##if pu2 > 0 or pu5 > 0:
##        print(
##    f"{'odměna':<20}{Kc(odm):>15}{', z toho '}{pu}{' x '}{odm_1u}{' '}{pu2}{' x '}{2*odm_1u}{' '}{pu5}{' x '}{int(0.5*odm_1u)}",)
####        print("odměna\t\t",odm,"Kč z toho ",pu,"x",u," ",pu2,"*",2*u," ",pu5,"*",0.5*u)
##else:
##        print(
##        f"{'odměna':<20}{Kc(odm):>15}{','}",
##        f"{'tj. '}{pu}{' x '}{int(odm_1u)}{' Kč'}",
##        )
##
##print(
##    f"{'režijní paušál':<20}{Kc(cp):>15}{', tj. '}{pu+2*pu2+pu5}{' x 300 Kč'}",
##    )
##if cest > 0:
##        print(
##            f"{'cestovné':<20}{Kc(cest):>15}",)
##if ztrat > 0:
##        print(
##            f"{'ztrátový čas:':<20}{Kc(ztrat):>15}",)
##print(
##    f"{'základ':<20}{Kc(zaklad):>15}",
##    f"\n{'DPH':<20}{Kc(dph):>15}",)
##if sp > 0:
##        print(
##            f"{'soud. popl.':<20}{Kc(sp):>15}",)
##if ost > 0:
##        print(
##            f"{'ostatní náklady':<20}{Kc(ost):>15}",)
##print(
##    f"{'náhr. celkem s DPH':<20}{Kc(celkem):>15}",)
##if sp > 0 or ost > 0:
##        print(
##            f"{'náhr. celkem bez DPH':<20}{Kc(bezd):>15}",)
##
##
##
##if True:
##    try:
##        print('\nControl + C pro ukončení programu.\n')
##       # time.sleep(6000)
##    except KeyboardInterrupt:
##        print('\n\nProgram ukončen\n')

        
