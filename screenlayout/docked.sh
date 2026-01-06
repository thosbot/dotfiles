#!/bin/sh
xrandr \
    --output eDP-1 --primary --mode 1600x900 --pos 320x0 --rotate normal \
    --output DP-1 --mode 1920x1080 --pos 1920x0 --rotate normal \
    --output DP-2 --off
