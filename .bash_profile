[[ -f ~/.bashrc ]] && . ~/.bashrc

# export ~/.local/bin to the PATH
export PATH="$PATH:$HOME/.local/bin"

# autostart qtile if logging in from TTY1
if [[ "$(tty)" = "/dev/tty1" ]] && ! pgrep -x qtile > /dev/null; then
    startx
fi
