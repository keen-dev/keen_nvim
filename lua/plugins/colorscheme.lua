return {
	{
		-- Theme inspired by Atom
		'navarasu/onedark.nvim',
		priority = 1000,
		config = function()
			vim.cmd.colorscheme 'onedark'
		end,
	},
	-- {
	-- 	'Alexis12119/nightly.nvim',
	-- 	priority = 1000,
	-- 	config = function()
	-- 		local color = require("nightly").setup({
	-- 			transparent = false,
	-- 			styles = {
	-- 				comments = { italic = true },
	-- 				functions = { italic = false },
	-- 				variables = { italic = false },
	-- 				keywords = { italic = false },
	-- 			},
	-- 			highlights = {},
	--
	-- 			vim.cmd.colorscheme 'nightly'
	--
	-- 		})
	-- 	end
	--
	-- }
	-- {
	-- 	'bluz71/vim-nightfly-colors',
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd [[colorscheme nightfly]]
	-- 	end
	-- }
}
