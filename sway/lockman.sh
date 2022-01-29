#!/bin/sh
# Times the screen off and puts it to background
swayidle \
    timeout 10 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' &
# Locks the screen immediately
swaylock --clock --indicator --indicator-radius 100 --screenshots --effect-scale 0.4 --effect-vignette 0.2:0.5 --effect-blur 7x5 --ring-color bb00cc --key-hl-color 880033 --line-color 00000000 --inside-color 00000088 --separator-color 00000000 --fade-in 0.2
# Kills last background task so idle timer doesn't keep running
kill %%