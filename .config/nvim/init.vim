call plug#begin()

Plug 'catppuccin/nvim', { 'as': 'catppucin' }
Plug 'nvim-tree/nvim-tree.lua'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

call plug#end()

let mapleader = " "

set background=dark
set number
set termguicolors
set cursorline
set softtabstop=4
set expandtab
set autoindent
set fileformat=unix
set ts=4 sw=4
set splitright
set encoding=utf-8
syntax on

map <leader>n :NvimTreeToggle<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd FileType python map <buffer> <leader>r <esc>:w<cr>:exec '!python' shellescape(@%, 1)<cr>

colorscheme tokyonight-night

lua <<EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require('nvim-tree').setup()
require('Comment').setup()

require'nvim-treesitter.configs'.setup {
  highlight = { enable = true }
}

EOF
