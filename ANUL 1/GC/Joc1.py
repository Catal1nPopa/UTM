from tkinter import *
HEIGHT=650
WIDTH=550
window = Tk()
window.title('Space guardians')
panza=Canvas(window, width=WIDTH, height=HEIGHT, bg='gray')
my_image=PhotoImage(file='Space.gif')
panza.create_image(25,25, anchor=NW, image=my_image)
panza.pack()

# Creăm nava cosmică și o fixăm în poziția inițială
nava = panza.create_polygon(25,0,35,0,60,40,0,40, fill='Gold',
outline='DarkMagenta')
POZ_Y = (HEIGHT - 50)
POZ_X = WIDTH / 2
panza.move(nava, POZ_X, POZ_Y)

#Creăm mișcarea navei cosmice
PAS_MISCARE_PIXELI = 10
def nava_move(press):
    if press.keysym == 'Left':
        panza.move(nava, -PAS_MISCARE_PIXELI,0)
    elif press.keysym == 'Right':
        panza.move(nava, PAS_MISCARE_PIXELI,0)
    elif press.keysym == 'Up':
        make_shoot()
panza.bind_all('<Key>', nava_move)

#Creăm navele inamice
from random import randint
nava_inamica_nr = list()
nava_inamica_vit = list()
def nave_inamice():
    y = 0
    x = randint (40, WIDTH - 40)
    vit = randint(2,5)
    nr1 = panza.create_oval(x-20,y-20,x+20,y+20,
fill='red', outline='black')
    nava_inamica_nr.append(nr1)
    nava_inamica_vit.append(vit)

#Creăm mișcarea flotei de nave nave_inamice
def move_nave_inamice():
    for i in range(len(nava_inamica_nr)):
        panza.move(nava_inamica_nr[i],0,nava_inamica_vit[i])

#Creăm muniția pentru nava și evenimentul de lansare a muniției
shoot_nr = list()
shoot_vit = 12
def make_shoot():
    if len(shoot_nr)<3:
        pos = panza.coords(nava)
        x = pos[0]
        y = pos[1]
        nr1 = panza.create_oval(x-6,y-6,x+6,y+6, fill='yellow',
outline='blue')
        shoot_nr.append(nr1)

#Mișcăm muniția
def move_shoot():
    for i in range(len(shoot_nr)):
        panza.move(shoot_nr[i],0,-shoot_vit)

#Determinăm poziția muniției pe câmpul de joacă
def coords_shoot(nr_id):
    pos = panza.coords(nr_id)
    x = (pos[0]+pos[2])/2
    y = (pos[1]+pos[3])/2
    return x,y

# Ștergem muniția din câmpul de joacă și din listă
def del_shoot(i):
    panza.delete(shoot_nr[i])
    del shoot_nr[i]

#Ștergem muniția când depășeșete câmpul de joacă
def clean_shoot():
    for i in range(len(shoot_nr)-1,-1,-1):
        x,y = coords_shoot(shoot_nr[i])
        if y < 0:
            del_shoot(i)

#Determinarea coordonatelor navelor inamice
def coords_nava_inamica(nr_id):
    pos = panza.coords(nr_id)
    x = (pos[0]+pos[2])/2
    y = (pos[1]+pos[3])/2
    return x,y

#Ștergem navele inamice
def del_nava_inamica(i):
    panza.delete(nava_inamica_nr[i])
    del nava_inamica_nr[i]

#Ștergem navele inamice
def clean_nava_inamica():
    for i in range(len(nava_inamica_nr)-1,-1,-1):
        x,y = coords_nava_inamica(nava_inamica_nr[i])
        if y > HEIGHT:
            del_nava_inamica(i)

#Creăm funcția care va calcula distanța dinte nava inamică și proiectil
from math import sqrt
def distance(nr1,nr2):
    x1,y1 = coords_nava_inamica(nr1)
    x2,y2 = coords_shoot(nr2)
    return sqrt((x2-x1)**2+(y2-y1)**2)

#Stergem corabia inamică și proiectilul care a nimerit în ea
def bumm():
    for i in range(len(nava_inamica_nr)-1,-1,-1):
        for n in range(len(shoot_nr)-1,-1,-1):
            if distance(nava_inamica_nr[i],shoot_nr[n])<26:
                del_nava_inamica(i)
                del_shoot(n)

from time import sleep, time

while True:
    if randint(1,40) == 1:
        nave_inamice()
    move_nave_inamice()
    move_shoot()
    clean_shoot()
    clean_nava_inamica()
    bumm()
    window.update()
    sleep(0.05)
