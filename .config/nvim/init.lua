local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'bluz71/vim-moonfly-colors'
Plug 'shaunsingh/nord.nvim'
Plug 'projekt0n/github-nvim-theme'
Plug 'blazkowolf/gruber-darker.nvim'

vim.call('plug#end')

vim.o.background = 'dark'
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.softtabstop = 4
vim.o.autoindent = true
vim.o.fileformat = 'unix'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.splitright = true
vim.o.encoding = 'utf-8'
vim.o.textwidth = 79
vim.o.shiftround = true
vim.o.expandtab = true

vim.cmd('colorscheme gruber-darker')

vim.g.mapleader = ' '
options = { noremap = true }
vim.keymap.set('n', '<leader>n', ':Ex<cr>', options)
vim.keymap.set('n', '<C-t>', '<cmd>tabnew<cr>', {noremap = true})

-- Enable detailed listing format
vim.g.netrw_liststyle = 1
vim.g.netrw_hide = 1						-- Show hidden files by default
vim.g.netrw_browse_split = 4				-- hsplit


require 'nvim-treesitter.configs'.setup {
	ensure_installed = {'javascript', 'typescript', 'c', 'lua', 'rust', 'python', 'bash'},
	highlight = { enable = true}
}
