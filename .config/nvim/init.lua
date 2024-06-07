local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('catppuccin/nvim', {as = 'catppuccin'})
Plug 'nvim-tree/nvim-tree.lua'
Plug 'numToStr/Comment.nvim'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('neoclide/coc.nvim', {branch = 'release'})
Plug('folke/tokyonight.nvim', {branch = 'main' })
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nyngwang/nvimgelion'
Plug 'sainnhe/gruvbox-material'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'joshdick/onedark.vim'
Plug 'projekt0n/github-nvim-theme'

vim.call('plug#end')

vim.o.background = 'dark'
vim.o.number = true
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.softtabstop = 4
vim.o.autoindent = true
vim.o.fileformat = 'unix'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.splitright = true
vim.o.encoding = 'utf-8'

--vim.cmd('colorscheme catppuccin-mocha')
--vim.cmd('colorscheme tokyonight-night')
vim.cmd('colorscheme github_dark_default')


vim.g.mapleader = ' '
options = { noremap = true }
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<cr>', options)
vim.keymap.set('n', '<silent>gd', '<Plug>(coc-definition)', options)
vim.keymap.set('n', '<silent>gr', '<Plug>(coc-references)', options)
vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)', options)
vim.keymap.set('i', '<c-space>', 'coc#refresh()', {silent = true, expr = true})
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', options)
vim.keymap.set('n', '<leader>fc', '<cmd>Telescope colorscheme<cr>', options)
vim.keymap.set('n', '<C-t>', '<cmd>tabnew<cr>', {noremap = true})
vim.keymap.set('n', '<leader>th', '<cmd>CocCommand document.toggleInlayHint<cr>')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup()
require('Comment').setup()
require 'nvim-treesitter.configs'.setup {
	ensure_installed = {'javascript', 'typescript', 'c', 'lua', 'rust', 'python', 'bash'},
	highlight = { enable = true}
}
require 'ibl'.setup {
	scope = { enabled = true }
}

function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
vim.keymap.set('n', 'K', '<cmd>lua _G.show_docs()<cr>', options)

vim.api.nvim_create_autocmd("FileType", { pattern = "python", 
    callback = function()
        vim.api.nvim_buf_set_keymap(0,"n","<leader>r", "<esc>:w<cr>:exec '!python' shellescape(@%, 1)<cr>", options)
end})

-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

