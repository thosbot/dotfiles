# Set background
xsetroot -solid "#000000" &
autorandr.py --change

xscreensaver &
workrave &
conky &
xfce4-terminal &
xfce4-terminal --title side-bash &

/usr/lib/notification-daemon/notification-daemon start &

# Set shift+right-alt to manage ligatures
setxkbmap -option lv3:ralt_switch_multikey &

# Turn off warning bell
xset b off &
