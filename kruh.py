# počítá pí házením šipek do kruhu

import random
import math

def pi(darts):
   count = int(0)
   z = 0
   while (count < darts):
      count = count + 1
      x = random.uniform(0.0, 2.0)
      y = random.uniform(0.0, 2.0)
      if (x- 1)**2 + (y - 1)**2 <= 1:
           #print 'je v kruhu'
           z = z + 1
      #else:
          #     print 'neni v kruhu'

##   print(z, 'z')
   ans = float(0)
   ans = (count - z) / z*4
   ans = (z / count) * 4 
##   print(ans,  'ans')
##   print(x,  'x')
##   print(y,  'y')
##   print(count,  'count')
   return ans

def run(rounds,darts,x=0):   
   z = 0
   if rounds > 0:      
      z += pi(darts)
      print(z,'z')      
      run(rounds-1,darts,x)
      return z
   else:
     print(x,'z')      

def run2(rounds,darts):
   z = 0
   a = rounds
   while rounds>0:
      z += pi(darts)
      rounds -= 1
   return z/a

def simple(x):
   def last(z):      
      return z
   return last(x)
