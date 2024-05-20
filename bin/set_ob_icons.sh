#!/bin/bash

# Set icons for running apps that Openbox cannot locate for some reason

sleep 8

if pgrep -x "conky" >/dev/null
then
    xseticon -name "conky (gypsy)" /usr/share/icons/hicolor/64x64/apps/conky-sm.png
fi

if pgrep -x "spotify" >/dev/null
then
    xseticon -name "Spotify" /usr/share/icons/hicolor/64x64/apps/spotify-client.png
fi

if pgrep -x "workrave" >/dev/null
then
    xseticon -name "Workrave" /usr/share/icons/hicolor/64x64/apps/workrave.png
fi
