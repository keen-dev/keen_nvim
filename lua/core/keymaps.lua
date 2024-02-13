-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set({ 'n', 'v' }, '<C-s>', ':w<CR>', { silent = true })
vim.keymap.set({ 'i' }, '<C-s>', '<Esc>:w<CR>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-/>', ':nohl<CR>', { silent = true })

-- Easy Motion
vim.keymap.set('n', '<leader><leader>', '<Plug>(easymotion-prefix)', { silent = true, desc = 'EasyMotion Prefix' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- File Explorer
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>')

-- Screen Movement
vim.keymap.set('n', '<C-u>', '<C-u>zz', { silent = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { silent = true })

-- Window Navigation
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', { silent = true })
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', { silent = true })
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', { silent = true })
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', { silent = true })

-- Window Management
vim.keymap.set('n', '<leader>wx', ':close<CR>', { silent = true, desc = '[X] Close window' })
vim.keymap.set('n', '<leader>wv', ':vsplit<CR>', { silent = true, desc = '[V]ertical split' })
vim.keymap.set('n', '<leader>wh', ':split<CR>', { silent = true, desc = '[H]orizontal split' })
vim.keymap.set('n', '<leader>wm', ':MaximizerToggle<CR>', { silent = true, desc = '[M]aximizer' })

vim.keymap.set('n', '<leader>wk', ':resize +5<CR>', { silent = true, desc = '[+] Resize vertically' })
vim.keymap.set('n', '<leader>wj', ':resize -5<CR>', { silent = true, desc = '[-] Resize vertically' })
vim.keymap.set('n', '<leader>wh', ':vertical resize +5<CR>', { silent = true, desc = '[+] Resize horizontally' })
vim.keymap.set('n', '<leader>wH', ':vertical resize +50<CR>', { silent = true, desc = '[+] Resize [H]orizontally - +50' })
vim.keymap.set('n', '<leader>wl', ':vertical resize -5<CR>', { silent = true, desc = '[-] Resize horizontally' })
vim.keymap.set('n', '<leader>wL', ':vertical resize -50<CR>', { silent = true, desc = '[-] Resize horizontally - -50' })

-- Telescope Keymaps
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>pg', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>pf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>p?', require('telescope.builtin').help_tags, { desc = '[S]earch [?]help' })
vim.keymap.set('n', '<leader>pw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>ps', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>pr', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>pd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>pp', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

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

vim.keymap.set('n', '<leader>tt', ':ToggleTerm<CR>', { silent = true, desc = '[T]oggle [T]erminal' })
vim.keymap.set('n', '<leader>tv', ':ToggleTerm size=135 direction=vertical<CR>',
	{ silent = true, desc = '[V]ertical [T]erminal' })
vim.keymap.set('n', '<leader>th', ':ToggleTerm size=40 direction=horizontal<CR>',
	{ silent = true, desc = '[H]orizontal [T]erminal' })
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>', { silent = true, desc = '[F]loating [T]erminal' })
