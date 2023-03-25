# Single monitor at startup
/home/.screenlayout/just-gypsy.sh

# Set background
xsetroot -solid "#000000" &

# Turn off warning bell
xset b off &

# Set shift+right-alt to manage ligatures
setxkbmap -option lv3:ralt_switch_multikey &

numlockx &
xscreensaver &
workrave &
conky &
signal-desktop &

/home/thomas/bin/seticons.sh &
