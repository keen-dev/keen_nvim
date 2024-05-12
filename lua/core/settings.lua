vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Set highlight on search
vim.o.hlsearch = true
vim.o.relativenumber = true
-- Make line numbers default
vim.wo.number = true

-- vim.o.shell = vim.fn.executable 'powershell' == 1
-- vim.o.shellcmdflag =
-- "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
-- vim.o.shellquote = ''
-- vim.o.shellxquote = ''
-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Screen Settings
vim.o.scrolloff = 10
vim.o.cursorline = true
-- vim.o.colorcolumn = "80"
vim.o.tabstop = 4

vim.o.conceallevel = 2
vim.o.concealcursor = ''

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})
