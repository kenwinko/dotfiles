local Plug = vim.fn['plug#']


vim.call('plug#begin')

Plug 'stevearc/oil.nvim'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'bluz71/vim-moonfly-colors'
Plug 'projekt0n/github-nvim-theme'
Plug 'rebelot/kanagawa.nvim'
Plug 'webhooked/kanso.nvim'

vim.call('plug#end')


vim.cmd('filetype plugin indent on')
vim.o.background = 'dark'
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.cinoptions = 'l1'
vim.o.softtabstop = 4
vim.o.autoindent = true
vim.o.fileformat = 'unix'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.encoding = 'utf-8'
vim.o.textwidth = 79
vim.o.shiftround = true
vim.o.splitright = true
vim.o.incsearch = true
vim.o.autochdir = true

vim.g.mapleader = ' '
options = { noremap = true }
vim.keymap.set('n', '<leader>n', ':Oil<cr>', options)
vim.keymap.set('n', '<C-t>', '<cmd>tabnew<cr>', {noremap = true})
vim.keymap.set('n', '<leader>m', ':make<CR>:cwindow<CR>', {noremap = true})

vim.opt.makeprg = "gcc -Wall -Wpedantic -Wextra -std=gnu99 -g -o %< %"
vim.opt.errorformat = "%f:%l: %m"

-- Enable detailed listing format
vim.g.netrw_liststyle = 1
vim.g.netrw_hide = 1                        -- Show hidden files by default
vim.g.netrw_browse_split = 4                -- hsplit

require("oil").setup({
	default_file_explorer = true,
	columns = {
		"permissions",
		"size",
		"mtime",
	}
})

require 'nvim-treesitter.configs'.setup {
    ensure_installed = {'c', 'python', 'bash'},
    highlight = { enable = true}
}


require("kanagawa").setup({
  compile = false,
  undercurl = true,
  commentStyle = { italic = true },
  functionStyle = { bold = true },
  keywordStyle = { italic = true, bold = true },
  statementStyle = { bold = true },
  typeStyle = { bold = true },
  terminalColors = true,
  overrides = function(colors)
    return {
      Comment = { fg = colors.palette.oniViolet, italic = true },   -- violet comments
      Function = { fg = "#80FFFF", bold = true },                   -- bold cyan for functions
      Keyword = { fg = "#FF75B5", bold = true, italic = true },     -- bold pink for keywords
      String = { fg = "#00FF87" },                                  -- green for strings
      Statement = { fg = "#FFB86C", bold = true },                  -- bold yellow for statements
	  Normal = { bg = "#000000"},
	  NormalNC = { bg = "#000000"},  
  }
  end,
})

vim.cmd('colorscheme kanso-zen')
