import pygame
import random
import copy
import game_module
from pygame.locals import *

class App():
    white = (255,255,255)
    yellow = (255,255,0) # >16
    green = (0,255,0) # 16
    blue = (0,0,255) # 8
    grey = (160,160,160) # 4
    lightgrey = (224,224,224) #2
    lightred = (255,102,102)
        
    def __init__(self):
         self.running = True
         self.tile = 100
         self.rows = 4
         self.mezera = 4
         self.space = (self.rows-2)*self.mezera
         self.size = self.width, self.height = self.tile*self.rows+5*self.mezera, self.tile*self.rows+5*self.mezera
         self.a = 0
         self.b = 0
         self.clock = pygame.time.Clock()
         self.move_a = 0
         self.red = (255, 0, 0)
         self.array = []
        # [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
         self.row = []
         for i in range(self.rows):
               abc = []
               for f in range(self.rows):
                   abc.append(0)
               self.array.append(abc)
               abc = 0   
         self.flip = True
         self.left= False
        
      
    def background(self):
        for i in range(5):
            pygame.draw.rect(self.screen,self.white,pygame.Rect(self.tile*i+i*self.mezera,0,self.mezera,self.height))
            pygame.draw.rect(self.screen,self.white,pygame.Rect(0,self.tile*i+i*self.mezera,self.width,self.mezera))
        
        # pygame.draw.rect(self.screen,"yellow",pygame.Rect(self.tile,,self.space,self.height))
        
        #pygame.display.flip()
    
    def draw(self,a,b,color):
        
        pygame.draw.rect(self.screen,color,pygame.Rect(a,b,self.tile,self.tile)) 
        if self.flip:
            pygame.display.flip()
               
    def vertical_array(self):
        b = []
        a = 0
        c = []
        self.vertical = []
        for i in range(len(self.array)):
            for f in range(len(self.array[i])):
                b.append(self.array[f][i])
            c.append(b)
            b = []
        self.array = c
      
            
    def horizontal_array(self):        
        b = []
        a = 0
        c = []
        self.horizontal = []
        for i in range(len(self.array)):
            for f in range(len(self.array[i])):
                b.append(self.array[f][i])
            c.append(b)
            b = []
        self.array = c
     
    
    
    def reverse_array(self):
        c = []
        for i in self.array:
            b = []
            for q in reversed(i):
                b.append(q)
            c.append(b)
        self.array = c
                        
    
    def new_game(self):
        self.random_tile()
        #self.random_tile()
       
        #self.draw_grid(self.array)
        #pygame.display.flip()
        
    
    
    def collision_base(self):
        for i in self.array:
            for q in range(0,len(i)-1):
                if i[q] == i[q+1]:
                    i[q] = 2*i[q]
                    i[q+1] = 0
    
    def collision_left(self):        
        self.move_left()
        self.collision_base()
        self.move(0)
        abc = self.random_tile()
        if abc == 0:
            self.end()
        self.shuffle()
        self.new_tile(abc)
#        self.shuffle()
    
    def collision_right(self):
        self.move_right()
        self.reverse_array()
        self.collision_base()
        self.reverse_array()
        self.move(1)
        abc = self.random_tile()
        if abc == 0:
            self.end()
        self.shuffle()
        self.new_tile(abc)
#        self.shuffle()
        
    def collision_up(self):
        self.move_up()
        self.vertical_array()
        self.collision_base()
        self.move_left()
        self.horizontal_array()
        abc = self.random_tile()
        if abc == 0:
            self.end()
        self.shuffle()
        self.new_tile(abc)
#        self.shuffle()
        
    def collision_down(self):
        self.move_down()
        self.vertical_array()
        self.reverse_array()
        self.collision_base()
        self.move_left()
        self.reverse_array()
        self.horizontal_array()
        abc = self.random_tile()
        if abc == 0:
            self.end()
        self.shuffle()
        self.new_tile(abc)
#        self.shuffle()
    
    def end(self):
        self.screen.fill("black")
        sysfont = pygame.font.get_default_font()
        font = pygame.font.SysFont(None, 100)
        img = font.render("Game over", True, self.red)
        size_font_rect = img.get_size()
        x_offset = size_font_rect[0]/2
        y_offset = size_font_rect[1]/2
        a = self.tile*self.rows/2-x_offset
        b = self.tile*self.rows/2-y_offset
        self.screen.blit(img, (a,b))
        pygame.display.update()
        pygame.time.wait(5000)
        pygame.quit()

    
    
    def move_left(self):
        for i in self.array:
            for f in i:
                if f == 0:
                    i.remove(f)
                    i.append(0)
 
       

    def move_right(self):
        self.reverse_array()
        self.move_left()
        self.reverse_array()
        
        
    
    
    def move_up(self):
        self.vertical_array()
        self.move_left()
        self.horizontal_array()
        
    
    def move_down(self):
        self.vertical_array()
        self.move_right()
        self.horizontal_array()
        
    
    def move(self,direction):
          if direction == 0:
              self.move_left()
          elif direction == 1:
              self.move_right()
          elif direction == 2:
              self.move_up()
          else:
              self.move_down()
#          self.shuffle()
          

    def shuffle(self):             
          self.screen.fill("black")
          self.background()
          self.draw_grid(self.array) 
            
        
         
    def draw_one_static_old(self,coord,number):
        a = coord[0]
        mez_a= coord[0]*self.mezera
        b = coord[1]
        mez_b = coord[1]*self.mezera  
        self.draw(a*self.tile+mez_a+self.mezera,b*self.tile+mez_b+self.mezera,self.lightgrey)
        self.number(coord,number)
    
    def draw_one_static(self,coord,number,color = lightgrey,ratio=1):
        """ inovovany plne funkcni draw neodkazujici na dalsi fce"""
        mez_a= coord[0]*self.mezera
        mez_b = coord[1]*self.mezera  
        rozmer_dlazd = self.tile*ratio
        a = coord[0]*self.tile+mez_a+self.mezera
        b = coord[1]*self.tile+mez_b+self.mezera
        pygame.draw.rect(self.screen,color,pygame.Rect(a,b,rozmer_dlazd,rozmer_dlazd)) 
        self.number(coord,number)
    
            
           
    def new_tile(self,coord):
        a = coord[0]
        mez_a= coord[0]*self.mezera
        b = coord[1]
        mez_b = coord[1]*self.mezera  
        self.draw(a*self.tile+mez_a+self.mezera,b*self.tile+mez_b+self.mezera,self.green)
        self.number(coord,2)
        pygame.display.flip()
        pygame.time.wait(500)
        

    def draw_grid(self,grid):
        for i in range(len(grid)):  
            for f in range(len(grid[i])):
                if grid[i][f] != 0:
                    self.draw_one_static([f,i],grid[i][f])
            var = 0
    #        for f in grid[i]:
    #            
    #            if f == 1:
    #                self.draw_one_static([var,i], 2)
    #            var += 1 

    def on_cleanup(self):
        pygame.quit()
        
        
    
    def random_tile(self):
        
        
        isFull = True
        for i in self.array:
            for f in i:
                if f == 0:
                    isFull = False                
        if not isFull: 
            a = random.randint(0,3)
            b = random.randint(0,3)
            while self.array[a][b] != 0:
                a = random.randint(0,3)
                b = random.randint(0,3)
            self.array[a][b] = 2              
            return [b,a]     
        if isFull:
            return 0
   
        
    
    def on_event(self):
        for event in pygame.event.get():
            if event.type == pygame.KEYDOWN:    
                if event.key == pygame.K_RIGHT or event.key == pygame.K_l:
                    #self.move(1)
                    self.collision_right()
                if event.key == pygame.K_LEFT or event.key == pygame.K_h:
                    #self.a -= 1
                    self.collision_left()
                      #self.move(0)
                if event.key == pygame.K_DOWN or event.key == pygame.K_j:
                    self.collision_down()
                if event.key == pygame.K_UP or event.key == pygame.K_k:
                    self.collision_up()
            if event.type == pygame.QUIT:
                    self.running = False
       
    def on_init(self):
        pygame.init()
        self.screen = pygame.display.set_mode(self.size, pygame.HWSURFACE | pygame.DOUBLEBUF)
        pygame.display.set_caption("2048 Dali Game")
        self.background()
      
        
        
        
    #     #self.array[random.randint(0,3)][random.randint(0,3)]=2
        
        
       
    def number(self,coord,num):
        text = str(num)
        sysfont = pygame.font.get_default_font()
        font = pygame.font.SysFont(None, 80)
        img = font.render(text, True, self.red).convert()
        size_font_rect = img.get_size()
        x_offset = 0.5*self.tile-size_font_rect[0]/2
        y_offset = 0.5*self.tile-size_font_rect[1]/2
        a = coord[0]*self.tile+self.mezera*coord[0]+self.mezera+x_offset
        b = coord[1]*self.tile+self.mezera*coord[1]+self.mezera+y_offset
        self.screen.blit(img, (a,b))
        pygame.display.update()

        
    def on_loop(self):
        self.draw_grid(self.array)
        pygame.display.flip()  
        while self.running:
            self.on_event()
            
            self.clock.tick(60)
        self.on_cleanup()

    def on_execute(self):
        self.on_init()
        self.random_tile()
        self.random_tile()
        self.shuffle()
        self.on_loop()
        # pygame.time.wait(10000)
        # self.on_cleanup()
       # self.on_loop()
