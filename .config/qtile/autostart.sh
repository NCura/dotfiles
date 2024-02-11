#!/bin/bash

# Screen setup
#xrandr --output DP-0 --primary --mode 3440x1440 --rate 100.00 --output DP-4 --mode 2560x1440 --rate 144.00 --left-of DP-0

setxkbmap es
xmodmap $HOME/.config/x11/.Xmodmap

picom &
dunst &
####nitrogen --restore &
#echo "Starting sxhkd" >> ~/autostart.log
sxhkd &

dir="$HOME/.local/share/wallpapers"
jpg_wallpaper="$dir/current-wallpaper.jpg"
png_wallpaper="$dir/current-wallpaper.png"

# Check for JPG wallpaper first, then PNG, and set it using qtile command if exists
if [ -f "$jpg_wallpaper" ]; then
   qtile cmd-obj -o screen -f set_wallpaper -a "$jpg_wallpaper" &
elif [ -f "$png_wallpaper" ]; then
   qtile cmd-obj -o screen -f set_wallpaper -a "$png_wallpaper" &
fi
