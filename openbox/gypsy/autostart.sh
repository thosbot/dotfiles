# Set background
xsetroot -solid "#000000" &

xscreensaver &
workrave &
conky &
signal-desktop &

# Set shift+right-alt to manage ligatures
setxkbmap -option lv3:ralt_switch_multikey &

# Turn off warning bell
xset b off &

# Mount network doc directory
rclone --log-file=.local/var/log/rclone.log --log-level=INFO mount linode:thosdoc-5ab1c42c thosdoc &
