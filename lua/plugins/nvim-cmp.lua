return {
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',

      'onsails/lspkind-nvim',

    },
    config = function()
      -- [[ Configure nvim-cmp ]]
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      local lspkind = require('lspkind')
      require('luasnip.loaders.from_vscode').lazy_load()
      luasnip.config.setup {

      }



      cmp.setup({

        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = {
            completeopt = 'menu,menuone,noinsert',
            border = 'rounded',
            winhighlight = 'Normal:CMPNormal',
          },
          documentation = {
            border = 'rounded',
            winhighlight = 'Normal:CMPNormal',
          }
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-d>'] = cmp.mapping.close(),
          -- ['<C-Space>'] = cmp.mapping.complete {},
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        }),

      })
      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })

      cmp.event:on('confirm_done', function(event)
        local entry = event.entry
        local vim_item = entry:get_completion_item()
        if vim_item.kind == cmp.lsp.CompletionItemKind.Function or vim_item.kind == cmp.lsp.CompletionItemKind.Method then
          local line = vim.api.nvim_get_current_line()
          local cursor = vim.api.nvim_win_get_cursor(0)
          local col = cursor[2]
          vim.api.nvim_set_current_line(line:sub(1, col) .. '()' .. line:sub(col + 1))
          vim.api.nvim_win_set_cursor(0, { cursor[1], col + 1 })
        end
      end)
    end
  }
}
