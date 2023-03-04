#!/bin/python

from pynput import mouse
import time
import sys
import os

def on_move(x, y):
    global last_x
    print(x, last_x)
    if last_x is None:
        last_x = x
    elif abs(x - last_x) >= step:
        if x > last_x:
            os.system(up)
        else:
            os.system(down)
        last_x = x

def on_click(x, y, button, pressed):
    if not pressed:
        return False

step = int(sys.argv[1])
up = sys.argv[2]
down = sys.argv[3]

last_x = mouse.Controller().position[0]
listener = mouse.Listener(on_move=on_move, on_click=on_click)
listener.start()

while listener.running:
    time.sleep(1)
