-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{
		'echasnovski/mini.pairs',
		version = '*',
		config = true
	},
	{
		'echasnovski/mini.nvim',
		version = false
	},

	'tpope/vim-surround',
	{ 'easymotion/vim-easymotion', event = "BufRead" },
	{ 'justinmk/vim-sneak',        event = "BufRead" },

	-- Git related plugins
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',

	-- Detect tabstop and shiftwidth automatically
	'tpope/vim-sleuth',

	-- "gc" to comment visual regions/lines
	{ 'numToStr/Comment.nvim', opts = {} },
	{
		-- Add indentation guides even on blank lines
		'lukas-reineke/indent-blankline.nvim',
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = 'ibl',
		opts = {},
	},
	-- { 'szw/vim-maximizer' },
	"nvim-neotest/nvim-nio",
	--
	-- {
	--   'gelguy/wilder.nvim',
	--   config = function()
	--     local wilder = require('wilder')
	--     wilder.setup({ modes = { ':', '/', '?' } })
	--   end
	-- },
	-- {
	--   "folke/noice.nvim",
	--   opts = {},
	--   dependencies = {
	--     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	--     "MunifTanjim/nui.nvim",
	--   }
	-- }
	--

}
