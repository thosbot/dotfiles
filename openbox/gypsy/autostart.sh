# Single monitor at startup
/home/.screenlayout/just-gypsy.sh

# Set background
xsetroot -solid "#000000" &

# Turn off warning bell
xset b off &

# Set shift+right-alt to manage ligatures
setxkbmap -option lv3:ralt_switch_multikey &

xscreensaver &
workrave &
conky &
signal-desktop &

/home/thomas/bin/seticons.sh &

# Mount network doc directory
rclone mount --daemon --vfs-cache-mode=full --log-file=.local/var/log/rclone.log --log-level=INFO linode:thosdoc-5ab1c42c thosdoc
