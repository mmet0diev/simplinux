#!/bin/bash

# 1. Launch the game $1
# The & at the end lets the script keep running while the game opens
steam steam://rungameid/$1 &

# 2. Wait for the game to fully load and take focus
# Increase this if the game takes a long time to start
echo "Waiting 12 seconds for game to load..."
sleep 11

# 3. Use Python (built-in) to simulate Alt + Enter
python3 << 'EOF'
import ctypes

# Load the necessary X11 libraries found on Mint by default
try:
    x11 = ctypes.CDLL('libX11.so.6')
    xtest = ctypes.CDLL('libXtst.so.6')
    
    display = x11.XOpenDisplay(None)
    if display:
        # Keycodes: 9 is Esc
        xtest.XTestFakeKeyEvent(display, 9, True, 0)  # Hold Esc
        xtest.XTestFakeKeyEvent(display, 9, False, 0) # Release Esc
        
        x11.XFlush(display)
        x11.XCloseDisplay(display)
        print("Sent Alt+Enter signal.")
    else:
        print("Error: Could not open display.")
except Exception as e:
    print(f"Python error: {e}")
EOF

echo "Done! If it didn't work, try increasing the sleep time."