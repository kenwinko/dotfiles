# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR='neovim'
set -o vi

PS1='[\u@\h \W]\$ '
alias ls="ls --color --color=auto"
alias ll="ls --color -lrth"
alias config="/usr/bin/git --git-dir=/home/kulak/.cfg/ --work-tree=/home/kulak"
