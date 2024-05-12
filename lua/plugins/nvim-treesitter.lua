return {
	{
		-- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		event = { 'BufReadPost', 'BufNewFile' },
		build = ':TSUpdate',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
			"windwp/nvim-ts-autotag",
		},
		config = function()
			vim.defer_fn(function()
				require('nvim-treesitter.configs').setup {
					-- Add languages to be installed here that you want installed for treesitter
					ensure_installed = {
						'c',
						'cpp',
						'go',
						'lua',
						'python',
						'rust',
						'tsx',
						'javascript',
						'typescript',
						'vimdoc',
						'vim',
						'bash',
						'c_sharp',
						'html',
						'htmldjango',
						'css',
						'json',
						'yaml',
						'markdown',
						'markdown_inline',
						'gitignore',
						'query',
						'svelte',
					},

					ignore_install = {},
					sync_install = false,
					-- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
					auto_install = false,

					highlight = { enable = true, },
					indent = { enable = true },
					autotag = { enable = true },
					incremental_selection = {
						enable = true,
						keymaps = {
							init_selection = 'gs',
							node_incremental = 'gs',
							scope_incremental = '<C-i>',
							node_decremental = '<M-Space>',
						},
					},

					textobjects = {
						select = {
							enable = true,
							lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
							keymaps = {
								-- You can use the capture groups defined in textobjects.scm
								['aa'] = '@parameter.outer',
								['ia'] = '@parameter.inner',
								['af'] = '@function.outer',
								['if'] = '@function.inner',
								['ac'] = '@class.outer',
								['ic'] = '@class.inner',
							},
						},
						move = {
							enable = true,
							set_jumps = true, -- whether to set jumps in the jumplist
							goto_next_start = {
								[']m'] = '@function.outer',
								[']]'] = '@class.outer',
							},
							goto_next_end = {
								[']M'] = '@function.outer',
								[']['] = '@class.outer',
							},
							goto_previous_start = {
								['[m'] = '@function.outer',
								['[['] = '@class.outer',
							},
							goto_previous_end = {
								['[M'] = '@function.outer',
								['[]'] = '@class.outer',
							},
						},
						swap = {
							enable = true,
							swap_next = {
								['<leader>j'] = '@parameter.inner',
							},
							swap_previous = {
								['<leader>J'] = '@parameter.inner',
							},
						},
					},
				}
			end, 0)
		end
	}

}
