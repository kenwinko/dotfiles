# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERM=st-256color # needed for c-x c-e
export EDITOR='nvim'
export moscow='192.168.250.45'
export kyoto='192.168.250.42'

set -o vi

PS1='[\u@\h \W]\$ '

alias ls="ls --color -F"
alias ll="ls --color -lrth"

bind '"\C-x\C-e": edit-and-execute-command'"
