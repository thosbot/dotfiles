# Auto-completion
complete -C /home/thomas/bin/terraform terraform
eval "$(gh completion -s bash)"

batt() {
    upower -i /org/freedesktop/UPower/devices/battery_BAT0
}

bright() {
    xrandr --output eDP-1 --brightness "$1"
}
