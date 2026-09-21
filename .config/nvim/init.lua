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
vim.keymap.set('n', "'", '`')
vim.keymap.set('n', '`', "'")
vim.keymap.set('n', '<leader>n', ':Oil<cr>')
vim.keymap.set('n', '<C-t>', '<cmd>tabnew<cr>')
vim.keymap.set('n', '<leader>m', ':make<CR>:cwindow<CR>')
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

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
