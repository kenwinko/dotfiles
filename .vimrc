filetype plugin indent on

set number
set relativenumber

set softtabstop=4
set tabstop=4
set shiftwidth=4
set shiftround
set autoindent
set smarttab

set fileformat=unix
set encoding=utf-8
set textwidth=79
set cinoptions=l1
set splitright
set incsearch
set autochdir
set showmatch
set showcmd
set hlsearch
set clipboard=unnamedplus

set termguicolors
set background=dark
hi Search ctermbg=LightYellow
hi Comment ctermfg=63

let mapleader = " "
nnoremap <leader>m :make<CR>:cwindow<CR>

set makeprg=gcc\ -Wall\ -Wpedantic\ -Wextra\ -std=gnu99\ -g\ -o\ %<\ %
set errorformat=%f:%l:\ %m

highlight RedundantWhitespace ctermbg=green guibg=green
match RedundantWhitespace /\s\+$\| \+\ze\t/
