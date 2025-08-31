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

	-- Motions: replaced EasyMotion/Sneak with flash.nvim (see lua/plugins/flash.lua)

	-- Git related plugins (lazy-load on commands)
	{ 'tpope/vim-fugitive', cmd = { 'Git', 'G', 'Gdiffsplit', 'Gread', 'Gwrite' } },
	{ 'tpope/vim-rhubarb',  cmd = { 'GBrowse' } },

	-- Detect tabstop and shiftwidth automatically
	{ 'tpope/vim-sleuth', event = 'VeryLazy' },

	-- "gc" to comment visual regions/lines
	{ 'numToStr/Comment.nvim', opts = {}, keys = { 'gc', 'gcc', 'gbc' } },
	{
		-- Add indentation guides even on blank lines
		'lukas-reineke/indent-blankline.nvim',
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = 'ibl',
		opts = {},
		event = { 'BufReadPost', 'BufNewFile' },
	},
	{ "nvim-neotest/nvim-nio", event = 'VeryLazy' },
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
