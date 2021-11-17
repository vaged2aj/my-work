# pocita pravdepodobnost vice pokusu s 50 % uspesnosti
from random import randint
from random import seed
from random import choice
import random
import time
import os
import math
from datetime import date
import pickle
import recover


def abc(num):
    a = 0
    b = 0 
    for i in range(0,num):
        
        xi = random.choice([True, False])
        #print(xi)
        if xi == True:
            return True
         
def wrap(num,num2):
    odo = 0
    aga = num
    while num > 0:
        num -= 1
        if abc(num2) == True:
           odo += 1 
    return odo/aga
