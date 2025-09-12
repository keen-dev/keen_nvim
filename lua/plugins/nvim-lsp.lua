return {

	{
		-- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ 'j-hui/fidget.nvim', opts = {} },

			-- Additional lua configuration, makes nvim stuff amazing!
			'folke/neodev.nvim',
		},
		config = function()
			-- [[ Configure LSP ]]
			--  This function gets run when an LSP connects to a particular buffer.
			local on_attach = function(_, bufnr)
				-- NOTE: Remember that lua is a real programming language, and as such it is possible
				-- to define small helper and utility functions so you don't have to repeat yourself
				-- many times.
				--
				-- In this case, we create a function that lets us more easily define mappings specific
				-- for LSP related items. It sets the mode, buffer and description for us each time.
				local nmap = function(keys, func, desc)
					if desc then
						desc = 'LSP: ' .. desc
					end

					vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
				end

				nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
				nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

				-- Use Telescope if available; otherwise fall back to built-in LSP
				local function with_telescope(fn_name, fallback)
					return function()
						local ok, tb = pcall(require, 'telescope.builtin')
						if ok and type(tb[fn_name]) == 'function' then
							return tb[fn_name]()
						end
						return fallback()
					end
				end

				nmap('gd', with_telescope('lsp_definitions', vim.lsp.buf.definition), '[G]oto [D]efinition')
				nmap('gr', with_telescope('lsp_references', vim.lsp.buf.references), '[G]oto [R]eferences')
				nmap('gI', with_telescope('lsp_implementations', vim.lsp.buf.implementation), '[G]oto [I]mplementation')
				nmap('<leader>D', with_telescope('lsp_type_definitions', vim.lsp.buf.type_definition), 'Type [D]efinition')
				nmap('<leader>ds', with_telescope('lsp_document_symbols', vim.lsp.buf.document_symbol), '[D]ocument [S]ymbols')
				nmap('<leader>ws', with_telescope('lsp_dynamic_workspace_symbols', vim.lsp.buf.workspace_symbol), '[W]orkspace [S]ymbols')

				-- See `:help K` for why this keymap
				nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
				nmap('<leader>sk>', vim.lsp.buf.signature_help, 'Signature Documentation')

				-- Lesser used LSP functionality
				nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
				nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
				nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
				nmap('<leader>wf', function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, '[W]orkspace List [F]olders')

				-- Create a command `:Format` local to the LSP buffer
				vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
					vim.lsp.buf.format()
				end, { desc = 'Format current buffer with LSP' })
			end

			-- Enable the following language servers
			--  Add/remove servers as needed; mason-lspconfig ensures they are installed
			--  and automatically sets them up via handlers below.
			local servers = {
				-- quick_lint_js = { filetypes = { 'javascript', 'typescript' } },
				-- clangd = {},
				-- gopls = {},
				pyright = {},
				-- rust_analyzer = {},
				ts_ls = {
					filetypes = { 'javascript', 'typescript', 'typescriptreact', 'typescript.tsx', 'javascriptreact' },
				},
				html = { filetypes = { 'html', 'twig', 'hbs', 'htmldjango' } },
				cssls = {},
				jsonls = {},
				emmet_ls = {
					filetypes = { 'html', 'css', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
				},
				tailwindcss = {},
				eslint = {},
				lua_ls = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
			}

            -- Setup mason and mason-lspconfig for automatic installs
            require('mason').setup()
            local mason_lspconfig = require('mason-lspconfig')
            mason_lspconfig.setup {
              ensure_installed = vim.tbl_keys(servers),
              automatic_installation = true,
            }

			-- Setup neovim lua configuration
			require('neodev').setup()

			-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

				-- Use mason-lspconfig to set up servers automatically when available,
				-- otherwise fall back to setting up the servers table directly.
				if type(mason_lspconfig.setup_handlers) == 'function' then
				  mason_lspconfig.setup_handlers {
				    function(server_name)
				      require('lspconfig')[server_name].setup {
				        capabilities = capabilities,
				        on_attach = on_attach,
				        settings = servers[server_name],
				        filetypes = (servers[server_name] or {}).filetypes,
				      }
				    end,
				  }
				else
				  for server_name, server_config in pairs(servers) do
				    require('lspconfig')[server_name].setup {
				      capabilities = capabilities,
				      on_attach = on_attach,
				      settings = server_config,
				      filetypes = server_config.filetypes,
				    }
				  end
				end
		end,
	},

}
