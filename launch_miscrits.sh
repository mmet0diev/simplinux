#!/bin/bash

# 1. Launch the game
# The & at the end lets the script keep running while the game opens
steam steam://rungameid/3628960 &

# 2. Wait for the game to fully load and take focus
# Increase this if the game takes a long time to start
echo "Waiting 15 seconds for Miscrits to load..."
sleep 15

# 3. Use Python (built-in) to simulate esc hold + release actions
python3 << 'EOF'
import ctypes

# Load the necessary X11 libraries found on Mint by default
try:
    x11 = ctypes.CDLL('libX11.so.6')
    xtest = ctypes.CDLL('libXtst.so.6')
    
    display = x11.XOpenDisplay(None)
    if display:
        # Keycodes: 64 is Alt_L, 36 is Return
        xtest.XTestFakeKeyEvent(display, 9, True, 0)  # Hold Esc
        xtest.XTestFakeKeyEvent(display, 9, False, 0) # Release Esc
        
        x11.XFlush(display)
        x11.XCloseDisplay(display)
        print("Sent esc signal.")
    else:
        print("Error: Could not open display.")
except Exception as e:
    print(f"Python error: {e}")
EOF

echo "Done! If it didn't work, try increasing the sleep time."