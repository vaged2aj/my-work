# stupidni program na vypocet uroku
import sys
import math
import time
import datetime
povoden = 0
ustomez = 0
pu = 0
pu2=0
pu5=0
sp = 0
vet = 's'
komplikace = False
cest = 0
ztrat = 0
jistina = 0
print("Úrok  -- program\n")
##od = '1.1.2000'
##do = '1.1.2100'
##sazba = 0.1
def main():
        while True:
                abc = ((input("Zadej jistinu v Kč: "))) 
                try:
                       #abc = int((input("Zadej tarifní hodnotu v Kč: "))) 
                        jistina = float(abc)
                        break
                except ValueError:
                        print("Zadej číslo")

        while True:
                abc = ((input("Zadej sazbu p.a. v %: "))) 
                try:
                       #abc = int((input("Zadej tarifní hodnotu v Kč: "))) 
                        sazba = float(abc)/100
                        break
                except ValueError:
                        print("Zadej číslo")


        ##while True:
        abc = ((input("Zadej datum úročení od: [dd.mm.rrrr] "))) 
        ##        try:
        ##               #abc = int((input("Zadej tarifní hodnotu v Kč: "))) 
        od = abc

        abc = ((input("Zadej datum úročení do: [dd.mm.rrrr] "))) 
        ##        try:
        ##               #abc = int((input("Zadej tarifní hodnotu v Kč: "))) 
        do = abc

                        
        ode = datetime.datetime.strptime(od, '%d.%m.%Y')
        dodo = datetime.datetime.strptime(do, '%d.%m.%Y')
        zet = (dodo-ode).days +1
        if zet<0:
                print("Datum do předchází datu od. ")
                
        roky = zet/365.25
        urok = round(roky  * sazba * jistina,2)
        ##print('Date:', ode.date())
        ##print('Date:', dodo.date())
        ##print(zet)
        ##print(zet/365.25)
        print("Jistina: ",jistina,"Kč, sazba ", sazba*100,"%, urok ", urok," Kč. Dní ",zet,
              ".")
        abc = ((input("Opakovat? [ano = 1, ne = ostatni] "))) 
##
        if abc == "1":
                main()
        else:
                time.sleep(360)

main()


