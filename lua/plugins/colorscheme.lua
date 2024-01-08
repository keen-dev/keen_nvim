return {
	{
		-- Theme inspired by Atom
		'navarasu/onedark.nvim',
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme 'onedark'
			require('onedark').setup({
				style = 'darker',
				transparent = true,
				lualine = {
					transparent = true,
				}
			})
			require('onedark').load()
		end,
	},
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin-mocha",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme "catppuccin-mocha"
	-- 	end
	-- },
	-- {
	-- 	"rmehri01/onenord.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme "onenord"
	-- 	end
	-- }
}
