return
{
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",

	},

	config = function()
		require("codecompanion").setup({
			strategies = {
				chat = {
					adapter = "ollama",
				},
				inline = {
					adapter = "ollama",
				},
				agent = {
					adapter = "ollama",
				},
			},
			adapters = {
				ollama = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "llama3.2:3b",
						schema = {
							model = {
								default = "llama3.2:3b",
							},
							num_ctx = {
								default = 16384,
							},
							num_predict = {
								default = -1,
							},
						},
					})
				end,
			},
		})
	end,
	keys = {
		{ "<LocalLeader>cd", "<cmd>CodeCompanionActions<cr>",     { mode = "n", noremap = true, silent = true } },
		{ "<LocalLeader>cd", "<cmd>CodeCompanionActions<cr>",     { mode = "v", noremap = true, silent = true } },
		{ "<LocalLeader>cc", "<cmd>CodeCompanionChat Toggle<cr>", { mode = "n", noremap = true, silent = true } },
		{ "<LocalLeader>cc", "<cmd>CodeCompanionChat Toggle<cr>", { mode = "v", noremap = true, silent = true } },
		{ "ga",              "<cmd>CodeCompanionChat Add<cr>",    { mode = "v", noremap = true, silent = true } },
	},
}
