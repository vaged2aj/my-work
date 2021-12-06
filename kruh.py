####x = 3  #Create variable x and assign value 3 to it
####x = x*x  #Bind x to value 9
####print x
####y = raw_input('enter a number:')
####print type(y)
####print y
####y = float(raw_input('Enter a number: '))
####print type(y)
####print y
####print y*y
####
####x = int(raw_input('Enter an integer: '))
####if x%2 == 0:
####    print 'Even'
####else:
####    print 'Odd'
####    if x%3 != 0:
####        print 'And not divisible by 3'
####
####x = int(raw_input('Enter x: '))
####y = int(raw_input('Enter y: '))
####z = int(raw_input('Enter z: '))
####
####if x < y:
####    if x < z:
####        print 'x is least'
####    else:
####        print 'z is least'
####else:
####    print 'y is least'
####
####if x < y:
####    if x < z:
####        print 'x is least'
####    else:
####        print 'z is least'
####elif y < z:
####    print 'y is least'
####else:
####    print 'z is least'  
####
####if x < y and x < z:
####    print 'x is least'
####elif y < z:
####    print 'y is least'
####else:
####    print 'z is least'
####    
####
#####Find the cube root of a perfect cube
###x = int(raw_input('Enter an integer: '))
###y = int(raw_input('Enter an integer: '))
###ans = 0
import random
import math
###x = math.pi
###y = 0
###z = int(0)
###x = random()
###print x
###print y
###print y
###while ans*ans*ans < abs(x):
###    ans = ans + 1
###    print 'current guess =', ans
### je v jednotkovem ctverci?
###if x < 1:
###    if y < 1:
###        print 'je v jednotkovem ctverci'
###else:
###    print 'neni v jednotkovem ctverci'
##var = 8 
##while (var < 200000):
##    alpha = float(math.pi / var) 
##    beta = 2 * (math.sin(alpha))
##    obvod = beta * var
##    pi = obvod / 2
##    var = var * 2 
##print pi
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
      

      
###
##



def simple(x):
   def last(z):      
      return z
   return last(x)
