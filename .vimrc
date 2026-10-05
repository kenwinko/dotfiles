call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

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
set clipboard=unnamedplus

set termguicolors
set background=dark
hi Search ctermbg=LightYellow
hi Comment ctermfg=63

let mapleader = " "
nnoremap <leader>m :make<CR>:cwindow<CR>


set makeprg=gcc\ -Wall\ -Wpedantic\ -Wextra\ -std=gnu99\ -g\ -o\ %<\ %
set errorformat=%f:%l:\ %m


let g:airline_powerline_fonts = 0
let g:airline_theme = "behelit"

highlight RedundantWhitespace ctermbg=green guibg=green
match RedundantWhitespace /\s\+$\| \+\ze\t/
