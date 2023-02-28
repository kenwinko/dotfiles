PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '


export EDITOR='vim'


eval "$(dircolors -b ~/.dircolors)"
alias ls="ls --color=auto"
alias config="/usr/bin/git --git-dir=/home/kulak/dotfiles.git/ --work-tree=/home/kulak"
