# source ~/.profile
[ -e "$HOME/.profile" ] && . "$HOME/.profile"

# autostart qtile if logging in from TTY1
[[ "$tty" = "/dev/tty1" ]] && pgrep qtile || startx

# export ~/.local/bin to the PATH
export PATH="$PATH:$HOME/.local/bin"
