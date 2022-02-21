# -*- coding: utf-8 -*-
"""
Created on Tue Feb  8 12:24:29 2022
game of 2048 with rudimentary animation, with pygame
@author: Dalibor
"""



import pygame
import random
import copy
import game_module
from pygame.locals import *
 
        
 

class Test(game_module.App): # App also on my Github
    white = (255,255,255)
#    yellow = (255,255,0) # >16
    green = (0,255,0) # 16
    blue = (0,0,255) # 8
    grey = (160,160,160) # 4
    lightgrey = (224,224,224) #2
    lightred = (255,102,102)
    red = (255, 0, 0)

    def __init__(self):
         super().__init__()
         self.changes = []
         self.my_grid = []
#         self.my_grid = [[1,2,2],[2,2,2],[3,2,2],[4,2,4]]
#         self.my_grid = [[1,1,2],[2,1,2],[3,1,2],[4,1,4],[1,2,4],[1,3,4],[3,2,16],[1,4,32],[3,3,4],[4,4,8]]
         #print(self.my_grid,35)
         self.array = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]
         self.yellow = (255,255,0) # >16
         self.test = [1,1,2]
         self.pop_list = []
       
         
    

    def random_tile_inov(self):
        full_list = []
        isFull = True
        tiles_total = 0
        abc = self.my_grid[:]
        for row in range(self.rows):
            for column in range(self.rows):
                full_list.append([row+1,column+1])
        empty_list = full_list[:]
        back_up_list = empty_list[:]
        for tile in abc:
            for item in empty_list: 
                if [tile[0],tile[1]] == item:
                    back_up_list.remove(item)
        for tile in self.my_grid:
            tiles_total += 1
        if tiles_total < self.rows*self.rows:
            isFull = False                
        if not isFull: 
            a = random.choice(back_up_list) 
            a.append(2)
            self.my_grid.append(a)
            self.draw_one_static(a,self.green)
        if isFull:
            return 0
   
    def new_game(self):
        self.random_tile_inov()
        self.random_tile_inov()

    def number_test(self,coord,num):
        text = str(num)
        sysfont = pygame.font.get_default_font()
        font = pygame.font.SysFont(None, 80)
        img = font.render(text, True, self.red)
        size_font_rect = img.get_size()
        x_offset = 0.5*self.tile-size_font_rect[0]/2
        y_offset = 0.5*self.tile-size_font_rect[1]/2
        a = coord[0]*self.tile+self.mezera*coord[0]+self.mezera+x_offset
        b = coord[1]*self.tile+self.mezera*coord[1]+self.mezera+y_offset
        self.screen.blit(img, (a,b))
        pygame.display.update()

    def raw_number(self,a_tile,b_tile,num = 2):
        text = str(num)
        sysfont = pygame.font.get_default_font()
        font = pygame.font.SysFont(None, 80)
        img = font.render(text, True, self.red)##.convert()
        size_font_rect = img.get_size()
        x_offset = 0.5*self.tile-size_font_rect[0]/2
        y_offset = 0.5*self.tile-size_font_rect[1]/2
        a = a_tile+x_offset
        b = b_tile+y_offset
        self.screen.blit(img, (a,b))


    def draw_raw(self,a,b,c):
        pygame.draw.rect(self.screen,self.lightgrey,pygame.Rect(a,b,c,c)) 

    def draw_one_static(self,coord,color=lightgrey,ratio=1):
        """ inovovany plne funkcni draw neodkazujici na dalsi fce"""
        mez_a= (coord[0]-1)*self.mezera
        mez_b = (coord[1]-1)*self.mezera  
        rozmer_dlazd = self.tile*ratio
        a = (coord[0]-1)*self.tile+mez_a+self.mezera
        b = (coord[1]-1)*self.tile+mez_b+self.mezera
        self.draw_raw(a,b,rozmer_dlazd)
        self.raw_number(a,b,coord[2])
        
    def make_coord(self,coord,ratio = 1):
        mez_a= (coord[0]-1)*self.mezera
        mez_b = (coord[1]-1)*self.mezera  
        rozmer_dlazd = self.tile*ratio
        a = (coord[0]-1)*self.tile+mez_a+self.mezera
        b = (coord[1]-1)*self.tile+mez_b+self.mezera
        return (a,b) 

    def animate_tile3(self,tile_in,tile_out,krok_hor,krok_vert):
        abc = self.make_coord(tile_in)
        cde = self.make_coord(tile_out)
        myrange = int(abs(cde[0]-abc[0]))+1, int(abs(cde[1]-abc[1]))+1
        self.draw_raw(abc[0]+krok_hor,abc[1]+krok_vert,self.tile)
        self.raw_number(abc[0]+krok_hor,abc[1]+krok_vert,tile_in[2])
        return myrange

    def engine(self,array,direction):
        ''' array jsou changes '''
        my_arr = array
        static = []
        factor = 40
        myrange = 20
        if direction == 0:
            for i in range(myrange):
                for f in my_arr:
                    abc = self.animate_tile3(f[0],f[1],-i*factor,0)
                    if abc[0]<i*factor:
                        my_arr.remove(f)
                        static.append(f[1])
                if static:
                    for q in static:
                        self.draw_one_static(q)
                pygame.display.flip()
                self.refresh_background()
        elif direction == 1:
            for i in range(myrange):
                for f in my_arr:
                    abc = self.animate_tile3(f[0],f[1],i*factor,0)
                    if abc[0]<i*factor:
                        my_arr.remove(f)
                        static.append(f[1])
                if static:
                    for q in static:
                        self.draw_one_static(q)
                pygame.display.flip()
                self.refresh_background()
        elif direction == 2:
            for i in range(myrange):
                for f in my_arr:
                    abc = self.animate_tile3(f[0],f[1],0,i*factor)
                    if abc[1]<i*factor:
                        my_arr.remove(f)
                        static.append(f[1])
                if static:
                    for q in static:
                        self.draw_one_static(q)
                pygame.display.flip()
                self.refresh_background()
        else:
            for i in range(myrange):
                for f in my_arr:
                    abc = self.animate_tile3(f[0],f[1],0,-i*factor)
                    if abc[1]<i*factor:
                        my_arr.remove(f)
                        static.append(f[1])
                if static:
                    for q in static:
                        self.draw_one_static(q)
                pygame.display.flip()
                self.refresh_background()
        if self.pop_list:
            self.pop_list = []


    def test_rows(self,list_of_tiles):
        ''' vrati radky ze seznamu '''
        working = []
        rows = []
        for f in range(self.rows):
            for tile in list_of_tiles:
                if tile[1] == f+1:
                    working.append(tile)
            if working:
                rows.append(working)
                working = [] 
        for row in rows:
                row.sort(key=lambda first: first[0])
        return rows


    def test_columns(self,list_of_tiles):
        working = []
        columns = []
        for f in range(self.rows):
            for i in list_of_tiles:
                if i[0] == f+1:
                    working.append(i)
            if working:
                columns.append(working)
                working = [] 
        for row in columns:
                row.sort(key=lambda first: first[1])
        return columns


    def logic(self,list_of_tiles,direction):
        #print(list_of_tiles,direction,246)
        abc = self.test_rows(list_of_tiles)
        cde = self.test_columns(list_of_tiles)
        new_list = []
        new_row = []   
        changes = []
        working_row = []
        if direction == 0:
            for row in abc:
                working_row = copy.deepcopy(row)
                f = 1
                for tile in row:
                    tile[0]=f
                    f += 1
                for f in range(len(working_row)):
                    changes.append([working_row[f],row[f]])
                working_row = []
                for tile in row:
                    new_list.append(tile)
#                print(new_list,262)
        elif direction ==1:
            for row in abc:
                working_row = copy.deepcopy(row)
                f = self.rows
                for tile in row:
                    tile[0]=f
                    f -= 1
                for f in range(len(working_row)):
                    changes.append([working_row[f],row[f]])
                working_row = []
                for tile in row:
                    new_list.append(tile)
#                print(new_list,278)
        elif direction == 2:
            for row in cde:
                working_row = copy.deepcopy(row)
                f = 1
                for tile in row:
                    tile[1]=f
                    f += 1
                f = 1
                    
                for f in range(len(working_row)):
                    changes.append([working_row[f],row[f]])
                working_row = []
                for tile in row:
                    new_list.append(tile)
        elif direction == 3:
             for row in cde:
                working_row = copy.deepcopy(row)
                f = self.rows-len(row)+1
                for tile in row:
                    tile[1]=f
                    f +=1
                for f in range(len(working_row)):
                    changes.append([working_row[f],row[f]])
                working_row = []
                for tile in row:
                    new_list.append(tile)
        self.my_grid = new_list
        self.changes = changes

        return new_list, changes
                     
    def detection2(self,row,direction):
        ''' row  = row or column'''
        to_upgrade = []
        to_remove = []
        if direction == 0:
            if len(row) > 1:
                f = 0
                while f < len(row)-1:
                    if row[f][2]==row[f+1][2]:
                        to_remove.append(row[f+1])
                        to_upgrade.append(row[f])
                        f +=2
                    else:
                        f +=1

            for tile in to_remove:
                row.remove(tile)
            for tile in to_remove:
                for tile2 in to_upgrade:
                    if tile==tile2:
                        to_upgrade.remove(tile2)
                
            for tile in row:
                for tile2 in to_upgrade:
                    if tile==tile2:
                        tile[2] *=2
        if direction == 1:
             if len(row) > 1:
                f = len(row)-1
                while f >0:
                    if row[f][2]==row[f-1][2]:
                        to_remove.append(row[f])
                        to_upgrade.append(row[f-1])
                        f -=2
                    else:
                        f -=1
                for tile in to_remove:
                    row.remove(tile)
                for tile in to_remove:
                    for tile2 in to_upgrade:
                        if tile==tile2:
                            to_upgrade.remove(tile2)
                for tile in row:
                    for tile2 in to_upgrade:
                        if tile==tile2:
                            tile[2] *=2
        return row
            
  


    def new_move(self,direction):
        abc = self.logic(self.my_grid,direction)
        self.my_grid = self.detection_wrapper(self.my_grid,direction)
        abc = self.logic(self.my_grid,direction)
        self.my_grid = abc[0]
        self.engine(abc[1],direction)        
#        self.refresh_background()
        self.draw_grid_test(self.my_grid)
        pygame.time.wait(500)
        self.random_tile_inov()
        pygame.display.flip()

    def unwrap(self,list_of_rows):
        ''' unwraps list of rows or columns into a list_of_tiles '''
        abc = []
        for row in list_of_rows:
            for tile in row:
                abc.append(tile)
        return abc
            
    def detection_wrapper(self,list_of_tiles,direction):
        abc = self.test_rows(list_of_tiles)
        cde = self.test_columns(list_of_tiles)
        if direction == 0:
            for i in abc:
                self.detection2(i,0)
        elif direction == 1:
            for i in abc:
                self.detection2(i,1)
        elif direction == 2:
            for i in cde: 
                self.detection2(i,0)
        elif direction == 3:
            for i in cde:
                self.detection2(i,1)
        if direction == 0 or direction == 1:
            return self.unwrap(abc)
        else:
            return self.unwrap(cde)


    def draw_grid_test(self,list_of_tiles):
        for i in list_of_tiles:
            self.draw_one_static(i)
        pygame.display.flip() 
    
    

    def draw_one_static_nonum(self,coord,number,color,ratio=1):
        mez_a= coord[0]*self.mezera
        mez_b = coord[1]*self.mezera  
        rozmer_dlazd = self.tile*ratio
        if ratio < 1 or ratio > 1:
            a = coord[0]*self.tile+mez_a+self.mezera+0.5*self.tile-0.5*rozmer_dlazd
            b = coord[1]*self.tile+mez_b+self.mezera+0.5*self.tile-0.5*rozmer_dlazd
        else:            
            a = coord[0]*self.tile+mez_a+self.mezera
            b = coord[1]*self.tile+mez_b+self.mezera
        pygame.draw.rect(self.screen,color,pygame.rect(a,b,rozmer_dlazd,rozmer_dlazd)) 

    def eat_tile(self,coord,number,color):
        self.draw_one_static_for_animation(coord,number,color,1.0)
        pygame.display.flip()
        pygame.time.wait(300)
        self.draw_one_static_for_animation(coord,number,color,1.1)
        pygame.display.flip()
        pygame.time.wait(300)
        self.screen.fill("black")
        pygame.display.flip()
        self.background()
        self.draw_one_static_for_animation(coord,number,color,1.0)
        pygame.display.flip()
        pygame.time.wait(300)
    

    def refresh_screen(self):
        self.screen.fill("black")
        self.background()
        pygame.display.flip()

    def refresh_background(self):
        self.screen.fill("black")
        self.background()

    def on_loop(self):
        pygame.display.flip()  
        while self.running:
            self.on_event_test()
            
            self.clock.tick(60)
        self.on_cleanup()

    def on_event_test(self):
        for event in pygame.event.get():
            if event.type == pygame.KEYDOWN:    
                if event.key == pygame.K_RIGHT or event.key == pygame.K_l:
                    self.new_move(1)
                if event.key == pygame.K_LEFT or event.key == pygame.K_h:
                    self.new_move(0)
                if event.key == pygame.K_DOWN or event.key == pygame.K_j:
                    self.new_move(3)
                if event.key == pygame.K_UP or event.key == pygame.K_k:
                    self.new_move(2)
            if event.type == pygame.QUIT:
                self.running = False

    def on_execute(self):
        self.on_init()
        self.background()
        self.new_game()
        pygame.display.flip()
        self.draw_grid_test(self.my_grid)
        self.on_loop()
#        abc = self.detection_wrapper(self.my_grid,0) 
###        print(self.my_grid,771)
 ###       abc = self.logic(self.my_grid,3)
#        print(abc[0],768)
#        print(abc[1],769)
#        pygame.display.flip()
#        abc = self.detection2([[1,1,2],[1,2,2],[1,3,4],[1,4,4]],1)
#        print(abc)
        self.on_cleanup()





if __name__ == "__main__" :
    theApp = Test()
    theApp.on_execute()
                    

