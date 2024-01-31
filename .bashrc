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

## for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

## check the window size after each command and update values for columns
shopt -s checkwinsize

# color prompt enable/disable
color_prompt=yes

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions file
[ -e ~/.config/aliasrc ] && . ~/.config/aliasrc

## exports
export EDITOR=nvim
export TERMINAL="kitty"
export LANG=en_US.UTF-8

export RANGER_LOAD_DEFAULT_RC=FALSE
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export LESSHISTFILE="-"

export LESS=-R

# vi mode
set -o vi

