batt() {
    upower -i /org/freedesktop/UPower/devices/battery_BAT0 \
        | grep 'percentage\|state\|time to full'
}

bright() {
    xrandr --output eDP-1 --brightness "$1"
}
