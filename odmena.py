import sys
import math
import time
import locale
povoden = 0
ustomez = 0
odm_1u = 0
pu = 0
pu2=0
pu5=0
sp = 0
vet = 's'
komplikace = False
cest = 0
ztrat = 0
l = locale.setlocale(locale.LC_ALL, '')
ost = 0
tarif = 0
viceukony = False
p = 300 #hodnota pausalu
sazba = 0.21 # dph sazba

print("Vyúčtování -- program\n")

#---------------------------------------------------------------------------------------
# funkce
     
def Kc(x):
    'vrati z hodnoty formatovane Kc'
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
    while True:
            abc = ((input("zadej počet 2*úkonů právní služby: "))) 
            try:
                    pu2 = int(abc)
                    break
            except valueerror:
                    print("zadej celé číslo")
    while True:
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

#-------------------------------------------------------------------------------------
# proceduralni cast


if test() == True:
    komplikace = True
    tarif = zadej_tar_hodnotu()
               
                       
if komplikace == True:
    if viceukony_ano() == True: #zada viceukony 
        viceukony = True
        (pu,pu2,pu5) = zadej_viceukony()
    else: # pro pripad kdyz jsou komplikace ale ne viceukony
        pu = pocet_ukonu()
        

    if byl_sop() == True:
        sp = vyse_sop(tarif)
    
    ost = ostatni_n() #dotaze se na ostatni naklady
    odm_1u = kraceni(tarif) #dotaze se na kraceni podle 12a AT
    (cest,ztrat) = cest_ztrat()#dotaze se na ztratovy cas a cest, ulozi

else:
    tarif = zadej_tar_hodnotu()
    pu = pocet_ukonu() #zadej pocet ukonu v pripade ze nejsou komplikace
    odm_1u = int(tarif_f(tarif))
#-------------------------------------------------------------------------------------
# vypocet 

odm = int(odm_1u * pu + odm_1u * pu2 * 2 + odm_1u * pu5 *0.5) #odmena cely, dvoj, pul ukon
cp = p * (pu + 2*pu2 + pu5) #celkovy pausal
zaklad = odm + cp + ztrat + cest
dph = round(sazba * zaklad,2)
celkem = round(zaklad + dph + sp+ost,2)
bezd = celkem - dph

#-------------------------------------------------------------------------------------
# print


print("----------------------------------------------\n")




print(
    f"{'tarifní hodnota':<20}{Kc(int(tarif)):>15}",)

print(
    f"{'počet úkonů':<20}{pu+pu2+pu5:>15}",)

if pu2 > 0 or pu5 > 0:
        print(
    f"{'odměna':<20}{Kc(odm):>15}{', z toho '}{pu}{' x '}{int(odm_1u)}{' '}{int(pu2)}{' x '}{int(2*odm_1u)}{' '}{pu5}{' x '}{int(0.5*odm_1u)}",)
##        print("odměna\t\t",odm,"Kč z toho ",pu,"x",int(u)," ",pu2,"*",int(2*u)," ",pu5,"*",int(0.5*u))
else:
        print(
        f"{'odměna':<20}{Kc(odm):>15}{','}",
        f"{'tj. '}{pu}{' x '}{int(odm_1u)}{' Kč'}",
        )

print(
    f"{'režijní paušál':<20}{Kc(cp):>15}{', tj. '}{pu+2*pu2+pu5}{' x 300 Kč'}",
    )
if cest > 0:
        print(
            f"{'cestovné':<20}{Kc(cest):>15}",)
if ztrat > 0:
        print(
            f"{'ztrátový čas:':<20}{Kc(ztrat):>15}",)
print(
    f"{'základ':<20}{Kc(zaklad):>15}",
    f"\n{'DPH':<20}{Kc(dph):>15}",)
if sp > 0:
        print(
            f"{'soud. popl.':<20}{Kc(sp):>15}",)
if ost > 0:
        print(
            f"{'ostatní náklady':<20}{Kc(ost):>15}",)
print(
    f"{'náhr. celkem s DPH':<20}{Kc(celkem):>15}",)
if sp > 0 or ost > 0:
        print(
            f"{'náhr. celkem bez DPH':<20}{Kc(bezd):>15}",)

if True:
    try:
        print('\nControl + C pro ukončení programu.\n')
        time.sleep(3600)
    except KeyboardInterrupt:
        print('\n\nProgram ukončen\n')

        
