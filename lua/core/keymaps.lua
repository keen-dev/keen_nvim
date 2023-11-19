-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set({ 'n', 'v', 'i' }, '<C-s>', ':w<CR>')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Custom Keymaps
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>')
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')

vim.keymap.set('n', '<leader>sx', ':close<CR>')
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>')
vim.keymap.set('n', '<leader>sh', ':split<CR>')


-- Telescope Keymaps
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>s?', require('telescope.builtin').help_tags, { desc = '[S]earch [?]help' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

-- ToggleTerm Keymaps
function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
	vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
	vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

vim.keymap.set('n', '<leader>tt', ':ToggleTerm<CR>', { desc = '[T]oggle [T]erminal' })
vim.keymap.set('n', '<leader>tv', ':ToggleTerm size=60 direction=vertical<CR>', { desc = '[V]ertical [T]erminal' })
vim.keymap.set('n', '<leader>th', ':ToggleTerm size=40 direction=horizontal<CR>', { desc = '[H]orizontal [T]erminal' })
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>', { desc = '[F]loating [T]erminal' })

-- Harpoon Keymaps
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', 'ga', function() mark.add_file() end, { desc = 'Harpoon [A]dd file' })
vim.keymap.set('n', 'gh', function() ui.toggle_quick_menu() end, { desc = '[H]arpoon quick menu' })
vim.keymap.set('n', 'gj', function() ui.nav_prev() end, { desc = 'Harpoon Prev' })
vim.keymap.set('n', 'gk', function() ui.nav_next() end, { desc = 'Harpoon Next' })
vim.keymap.set('n', 'gm', function() ui.nav_file(1) end, { desc = 'First Nav' })
vim.keymap.set('n', 'g,', function() ui.nav_file(2) end, { desc = 'Second Nav' })
vim.keymap.set('n', 'g.', function() ui.nav_file(3) end, { desc = 'Third Nav' })
vim.keymap.set('n', 'g/', function() ui.nav_file(4) end, { desc = 'Fourth Nav' })
