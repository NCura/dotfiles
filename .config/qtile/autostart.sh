#!/bin/bash

# Screen setup
xrandr --output DP-0 --primary --mode 3440x1440 --rate 100.00 --output DP-4 --mode 2560x1440 --rate 144.00 --left-of DP-0

setxkbmap es
xmodmap $HOME/.config/x11/.Xmodmap

picom &
dunst &
####nitrogen --restore &


sxhkd &

dir="$HOME/.local/share/wallpapers"
jpg_wallpaper="$dir/current-wallpaper.jpg"
png_wallpaper="$dir/current-wallpaper.png"

# Check for JPG wallpaper first, then PNG, and set it using qtile command if exists
if [ -f "$jpg_wallpaper" ]; then
    qtile cmd-obj -o cmd -f screen[0].set_wallpaper -a "$jpg_wallpaper" -a fill &
elif [ -f "$png_wallpaper" ]; then
    qtile cmd-obj -o cmd -f screen[0].set_wallpaper -a "$png_wallpaper" -a fill &
fi