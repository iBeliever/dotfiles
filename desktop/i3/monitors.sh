#!/bin/bash

# toggles the external monitor on/off in specified direction
IN="eDP-1"
EXT="DP-1"

USE_BOTH=false

if (xrandr | grep "$EXT disconnected"); then
    xrandr --output $IN --auto --output $EXT --off 
elif [ $USE_BOTH == true ]; then
    # External monitor to left of internal display and scaled correctly
    xrandr --output $IN --auto --pos 3840x0 \
           --output $EXT --auto --panning 3840x2160+0+0 --scale 2x2 --pos 0x0
else
    xrandr --output $IN --off \
           --output $EXT --auto --panning 3840x2160+0+0 --scale 2x2 --pos 0x0
fi
