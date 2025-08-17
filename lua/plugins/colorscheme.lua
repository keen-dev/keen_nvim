return {
	-- {
	-- 	-- Theme inspired by Atom
	-- 	'navarasu/onedark.nvim',
	-- 	priority = 1000,
	-- 	config = function()
	-- 		-- vim.cmd.colorscheme 'onedark'
	-- 		require('onedark').setup({
	-- 			style = 'darker',
	-- 			transparent = true,
	-- 			lualine = {
	-- 				transparent = true,
	-- 			}
	-- 		})
	-- 		require('onedark').load()
	-- 	end,
	-- },
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		priority = 1000,
		opts = {
			flavour = 'mocha',
			transparent_background = true,
		},
		config = function(_, opts)
			require('catppuccin').setup(opts)
			vim.cmd.colorscheme 'catppuccin'
		end,
	}

	-- {
	-- 	"rmehri01/onenord.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme "onenord"
	-- 	end
	-- }
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			style = 'moon',
	-- 			transparent = true,
	-- 		})
	--
	-- 		vim.cmd("colorscheme tokyonight")
	-- 	end,
	-- }
}
