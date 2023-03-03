export PS1="\[\e[31m\][\[\e[m\]\[\e[38;5;172m\]\u\[\e[m\]@\[\e[38;5;153m\]\h\[\e[m\] \[\e[38;5;214m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]\\$ "
export EDITOR='vim'

eval "$(dircolors -b ~/.dircolors)"
alias ls="ls --color=auto"
alias config="/usr/bin/git --git-dir=/home/kulak/dotfiles.git/ --work-tree=/home/kulak"
