#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# export ~/.local/bin to the PATH
export PATH="$PATH:$HOME/.local/bin"

# autostart qtile if logging in from TTY1
#if [[ "$(tty)" = "/dev/tty1" ]] && ! pgrep -x qtile > /dev/null; then
#   exec startx
#fi
# if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
#   exec startx
# fi