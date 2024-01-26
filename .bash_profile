# source ~/.profile
[ -e "$HOME/.profile" ] && . "$HOME/.profile"

# autostart qtile if logging in from TTY1
if [[ "$(tty)" = "/dev/tty1" ]] && ! pgrep -x qtile > /dev/null; then
    startx
fi


# export ~/.local/bin to the PATH
export PATH="$PATH:$HOME/.local/bin"
