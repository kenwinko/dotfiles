" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'preservim/vim-indent-guides'
Plug 'ycm-core/YouCompleteMe'

Plug 'python-mode/python-mode'
"Plug 'dense-analysis/ale'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set number
set termguicolors
set cursorline
set softtabstop=4
set textwidth=79
set fileformat=unix
set ts=4 sw=4
set splitright
set expandtab
set encoding=utf-8

au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let g:pymode_options_colorcolumn = 0
let g:ycm_autoclose_preview_window_after_completion=1

let mapleader = " "
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

let python_highlihght_all=1
syntax on
colorscheme catppuccin_mocha
