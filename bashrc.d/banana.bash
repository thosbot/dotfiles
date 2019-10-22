batt() {
    upower -i /org/freedesktop/UPower/devices/battery_BAT0
}

bright() {
    xrandr --output eDP-1 --brightness "$1"
}
