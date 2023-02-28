" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'ycm-core/YouCompleteMe'
Plug 'python-mode/python-mode'
Plug 'dense-analysis/ale'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set number
set termguicolors
set cursorline
set ts=4 sw=4
set splitright
set expandtab

colorscheme catppuccin_mocha
syntax on
let g:pymode_options_colorcolumn = 0
