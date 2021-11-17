from random import randint
from random import seed
import time
import os
import math
from datetime import date
import pickle
import recover
time.sleep(0.5)
import xml.etree.ElementTree as ET
class nasobeni:      
    def __init__(self):
        self.timeout_state = False        
        self.timeout = time.time() + 60*30
        self.celkem = 0
        self.check = 0
        self.zbyva = 0.0
        self.loop_count = 0
        self.loop = False
        self.a = 0
        self.b = 0
        self.lines = 70*'-'
    def cls(self):os.system('cls' if os.name=='nt' else 'clear')
    def zbyva_cas(self):                                        # ulozi do promenne zbyvajici cas, kontrola zaporneho casu    
        self.zbyva = self.timeout - time.time()
        if self.zbyva < 0:
            self.zbyva = 0
    def zbyva_print(self):                                      # vytiskne zbyvajici cas        
        print("zbýva ",math.floor(self.zbyva/60), "min", math.floor(self.zbyva%60),"sek")       
    def celkem_add(self):
        self.celkem += 1
    def check_add(self):
        self.check += 1
    def inp(self):
        while True:
            try:
                number = int(input("Výsledek? "))
                self.check_add()
                return number
            except ValueError:
                #self.check_add()
                time.sleep(0.1)
                print("Zadej čislo! ")            
    def inp_bad(self):
        while True:
            try:
                number = int(input("Výsledek? "))
                return number
                break
            except ValueError:
                time.sleep(0.1)
                print("Zadej cislo! ")
    def timeel(self):                                           # prepinac uplynul cas, nezavisly na jinych promenn. 
        if time.time() > self.timeout:
            self.timeout_state = True
    def nas_ode(self,b):
        if b == True:
            a=randint(1,99)
            b=randint(1,99)
            print(a); print("x"); print(b)
##            time.sleep(10)
##            self.cls()
            d = a*b
            return d
        else:
            a=randint(1,3000)
            b=randint(1,3000)
            print(a); print("minus");print(b)
            f = a-b
##            time.sleep(10)
##            self.cls()
            return f
    def random(self):
        rand = randint(0,1)
        return rand
    def check_both(self,x):
        if x == True:            
            a = self.nas_ode(True)        
        else:
            a = self.nas_ode(False)
        b = self.inp()
        while True:
            if a == b:
                time.sleep(0.1)
                print("Ok")
                self.zbyva_cas()
                self.zbyva_print()
                break
            else:
                time.sleep(0.1)
                self.bad_loop_start()
                print("Zkus znovu")                
                b = self.inp_bad()              
    def bad_loop_start(self):
        self.loop = True
    def bad_loop_stop(self):
        self.loop = False
    def bad_loop_count(self):
        if self.loop == True:
            self.loop_count += 1
    def prubezne(self):
        b = 0 
        if self.check == 0:
            b = 0
        else:
            b = self.loop_count/self.check*100
        print("Celkem: ", self.check, "špatně", self.loop_count, "procento ", round(b,1),"%\n")        
    def kombinator(self):
        if self.random() == 1:
            self.check_both(True)            
        else:
            self.check_both(False)
    def exec(self):
        self.timeel()
        try:            
            if self.timeout_state == False:
                self.zbyva_cas()
                self.kombinator()
                self.celkem_add()
                self.bad_loop_count()
                self.prubezne()
                self.bad_loop_stop()
                time.sleep(1)
                self.exec()                
            else:
                print("Vyprsel cas. ")
                time.sleep(3)
##                self.my_write()
                self.my_dbwrite()
                self.printo()
                
##                self.zapis()
        except KeyboardInterrupt:
            print("Konec")
            self.bad_loop_count()
            self.prubezne()
            time.sleep(3)
    def results(self):
        b = 0 
        if self.check == 0:
            b = 0
        else:
            b = round(self.loop_count/self.check*100)
        return b
    def my_write(self):
        f = open("stats-nas.txt","a+")
        f.write(f'{date.today()}'" ------- " f'Celkem: {self.check}' f' Spatne {self.loop_count}' f' Procento: {self.results()} % ''\n')
        f.close()       
    def stats_extract(self):
        with open("nas-db","rb") as f:
            '''extrahuje list dosavadnich vysledku'''
            b = pickle.load(f)
            f.close()       
            return b 
    def my_dnes(self):
        ''' pripravi list s dosavadnimi vysledky'''
        b = recover.nactixml()
        aj = []
        aj.append(str(date.today()))
        aj.append(self.check)
        aj.append(self.loop_count)
        aj.append(0)
        c = []
        b.append(aj)
        c = b
        return c 
    def my_dbwrite(self):
        c= self.my_dnes()
        recover.xmlwrite(c)

    def stats_dump(self,dnes):
        '''ulozi list dosavadnich vysledku'''
        with open("nas-db","wb") as d:
            pickle.dump(dnes,d)
            d.close()       

    def procento(self,a,b):     
        if b == 0:
            return 0
        else:
            return round(b/a *100)

    def printo(self):
        def procent(b,a):
            if b == 0:
                return 0
            else:
                return round(b/a*100,0)
        try:
            b = recover.nactixml()
    ##            print(b)
            with open("stat-nas.txt","w") as d:
                for i in range(0,len(b)):
                        d.write(b[i][0]),d.write('\t')
                        d.write('Celkem: 'f'{b[i][1]}''\t')
                        d.write('Špatně: 'f'{b[i][2]}''\t')
                        d.write('Procent: 'f'{int(procent(b[i][2],b[i][1]))}''\t')
                        
                        if b[i][3] == 1:
                            d.write('Dobře: 'f'{int(b[i][1])-int(b[i][2])}''\t')
                            d.write('Flash\n')
                        else:
                            d.write('Dobře: 'f'{int(b[i][1])-int(b[i][2])}''\t\n')
                            
                d.write(f'{self.lines}\n')
                d.write('Průměr')
                d.write('\t\tCelkem: 'f'{self.prumero()[0]}''\tŠpatně: 'f'{self.prumero()[1]}''\tProcent: 'f'{self.prumero()[2]}''\n')
                d.write(f'{self.lines}\n\n')
                d.write('\t\tmin:  'f'{self.prumero()[3]}')
                d.write('\tmin:  'f'{self.prumero()[5]}')
                d.write('\t\tmin:  'f'{self.prumero()[7]}\n')
                d.write('\t\tmax:  'f'{self.prumero()[4]}')
                d.write('\tmax:  'f'{self.prumero()[6]}')
                d.write('\tmax:  'f'{self.prumero()[8]}\n\n')
              
##                ''\tSpatne: 'f'{self.prumero()[1]}''\tProcento: 'f'{self.prumero()[2]}''\n\n')
        except IOError:
            print("Bez zapisu do souboru.")
        
    def prumero(self):
        try:
            b = recover.nactixml()
           # print(b)
            celkem = 0
            prumer_celkem = 0
            delka = len(b)
            spatne = 0
            prumer_spatne = 0 
            procentop = 0
            prumer_procento = 0
            def procent(b,a):
                if b == 0:
                    return 0
                else:
                    return round(b/a*100,0)
            procento = procent(spatne,celkem)
            min_celkem = b[1][1]
            max_celkem = b[1][1]
            min_spatne = b[1][2]
            max_spatne = 0   
            min_procento= 100
            max_procento= 0
                                       
            for i in range(0,len(b)): # stupidni bubble max, min a prumer
                jedn_celkem = b[i][1]             
                jedn_spatne = b[i][2]    
                celkem += jedn_celkem
                spatne += jedn_spatne
                if jedn_celkem > max_celkem:
                    max_celkem = jedn_celkem                   
                if jedn_celkem < min_celkem:
                    min_celkem = jedn_celkem
                if jedn_celkem < min_celkem:
                    min_celkem = jedn_celkem
                if procent(jedn_spatne,jedn_celkem) > max_procento:
               #     print(procent(jedn_spatne,jedn_celkem))
                    max_procento = procent(jedn_spatne,jedn_celkem)
                if procent(jedn_spatne,jedn_celkem) < min_procento:
                    min_procento = procent(jedn_spatne,jedn_celkem)
                if jedn_spatne > max_spatne:
                    max_spatne = jedn_spatne
                if jedn_spatne < min_spatne:
                    min_spatne = jedn_spatne
            prumer_spatne = int(round(spatne / delka,0))
            prumer_celkem = int(round(celkem / delka,0))
            prumer_procento = int(procent(spatne,celkem))
            min_procento_exp = int(min_procento)
            max_procento_exp = int(max_procento)
            return (prumer_celkem, prumer_spatne, prumer_procento,
                min_celkem, max_celkem,min_spatne,max_spatne,min_procento_exp,max_procento_exp)
            
        except IOError:
            print("Neni zdrojovy soubor.")
            return nil



fu = nasobeni()

fu.exec()
