# Set background
xsetroot -solid "#000000" &
autorandr.py --change

xscreensaver &
workrave &
conky &
xfce4-terminal &
xfce4-terminal --title side-bash &

/usr/lib/notification-daemon/notification-daemon start &

# Turn off warning bell
xset b off &
