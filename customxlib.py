# in order to use these functions, on a linux system, they will need to be installed using pip in a venv
# command -> python3 -m .venv

import sys
from Xlib import X, display
from Xlib.ext import xtest
import time

# Connect to the X Server (manages your displays, input, and windows)
d = display.Display()

# Reference the 'root' window (the background/desktop window that covers the whole screen)
# We move the pointer relative to this window to achieve absolute screen coordinates.
root = d.screen().root


def movemouse(x, y):
    time.sleep(0.1)
    root.warp_pointer(x, y)
    d.sync()


def pressbtn(btn=1):
    time.sleep(0.1)
    try:
        xtest.fake_input(d, X.ButtonPress, btn)
        time.sleep(0.02)
        xtest.fake_input(d, X.ButtonRelease, btn)
        time.sleep(0.01)
    except Exception as e:
        print(e)
    d.sync()

def presskey(btn: int):
    time.sleep(0.1)
    try:
        xtest.fake_input(d, X.KeyPress, btn)
        time.sleep(0.02)
        xtest.fake_input(d, X.KeyRelease, btn)
        time.sleep(0.01)
    except Exception as e:
        print(e)
    d.sync()
    
def sleep(secs: int):
    time.sleep(secs)