## If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

## bash history file location
HISTFILE="$HOME/.config/bash/bash_history"

## don't duplicate lines in history file
HISTCONTROL=ignoreboth:erasedups

## append to the history file, don't overwrite it
shopt -s histappend

## autocorrect cd misspellings
shopt -s cdspell

## expand aliases
shopt -s expand_aliases

## for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

## check the window size after each command and update values for columns
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# color prompt enable/disable
color_prompt=yes

# set PS1 prompt and make it pretty
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\
[\[\033[01;92m\]\u\
\[\033[01;31m\]  \
\[\033[01;94m\]\h\
\[\033[01;00m\]:\
\[\033[01;33m\]\w\
\[\033[00m\]]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions file
[ -e ~/.config/aliasrc ] && . ~/.config/aliasrc

## exports
export EDITOR=nvim
export TERMINAL="kitty"
export BROWSER="firefox"
export LANG=en_US.UTF-8

export RANGER_LOAD_DEFAULT_RC=FALSE
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"

export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '^[[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '^[[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '^[[0m')"
export LESS_TERMCAP_so="$(printf '%b' '^[[1;44;33m')"
export LESS_TERMCAP_us="$(printf '%b' '^[[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '^[[0m')"
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
export QT_QPA_PLATFORMTHEME="gtk2"

# vi mode
set -o vi

