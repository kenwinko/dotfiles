alias config='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
eval "$(dircolors -b ~/.dircolors)"
#------------------------------
# History stuff
#------------------------------
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

#------------------------------
# Variables
#------------------------------
export BROWSER="librewolf"
export EDITOR="nvim"

#------------------------------
# Keybindings
#------------------------------
bindkey -v
typeset -g -A key
bindkey '^?' backward-delete-char
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char 
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

#------------------------------
# Alias stuff
#------------------------------
alias ls="ls --color -F"
alias ll="ls --color -lth"
alias spm="sudo pacman"

#------------------------------
# ShellFuncs
#------------------------------
# -- coloured manuals
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

#------------------------------
# Comp stuff
#------------------------------
zmodload zsh/complist 
autoload -Uz compinit
compinit
zstyle :compinstall filename '${HOME}/.zshrc'

zstyle ':completion:*:pacman:*' force-list always
zstyle ':completion:*:*:pacman:*' menu yes select

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

#------------------------------
# Prompt
#------------------------------
autoload -U colors zsh/terminfo
colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats 'on %b '
precmd() { vcs_info }
setopt PROMPT_SUBST

PROMPT='%n@%m:%~%# '
# vim: set ts=2 sw=2 et:
