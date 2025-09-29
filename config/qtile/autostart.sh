#!/bin/sh

xrandr --output DP-2 --mode 1920x1080 --rate 165 --primary \
       --output HDMI-2 --rotate left --left-of DP-2
