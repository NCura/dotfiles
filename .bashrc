#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## Change color of command prompt
PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

## bash history file location
HISTFILE="$HOME/.config/bash/bash_history"
HISTSIZE=100000
HISTFILESIZE=200000

## don't duplicate lines in history file
HISTCONTROL=ignoreboth:erasedups

## append to the history file, don't overwrite it
shopt -s histappend

## autocorrect cd misspellings
shopt -s cdspell

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

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export RANGER_LOAD_DEFAULT_RC=FALSE
export LESSHISTFILE="-"
export LESS=-R

# vi mode
set -o vi

eval "$(ssh-agent -s)" > /dev/null
ssh-add ~/.ssh/github &> /dev/null
