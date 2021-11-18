import time
#import module
import locale
def Kc(x):
    'vrati z hodnoty formatovane Kc'
    l = locale.setlocale(locale.LC_ALL, '')
    return locale.currency(x, grouping=True)

def inp():
    while True:
        try:
            number = int(input("Zadej km "))
            return number
        except ValueError:
            #self.check_add()
            time.sleep(0.1)
            print("Zadej čislo! ")

def cestovne_func(km,x):
        nahr = (4.4,4.2)
        benz = (27.8,32)
        prum = 5.7
        vysl = round(km*nahr[x]+km*benz[x]*prum/100,0)
        vysl_text = str(Kc(vysl))
        return (vysl_text,x)


abc = cestovne_func(inp(),0)

print(abc[0],abc[1],'\n0...2021, 1...2020')

time.sleep(60)
