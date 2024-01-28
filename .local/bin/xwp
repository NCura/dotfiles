#!/bin/bash

dir="$HOME/.local/share/wallpapers"
jpg_wallpaper="$dir/current-wallpaper.jpg"
png_wallpaper="$dir/current-wallpaper.png"

if [ -f "$jpg_wallpaper" ]; then
    xwallpaper --zoom "$jpg_wallpaper"
elif [ -f "$png_wallpaper" ]; then
    xwallpaper --zoom "$png_wallpaper"
else
    echo "No suitable wallpaper found."
fi
