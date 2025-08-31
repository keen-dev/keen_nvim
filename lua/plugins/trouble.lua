return {
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = { 'Trouble' },
    opts = {},
    keys = {
      {
        '<leader>xx',
        function() require('trouble').toggle('diagnostics') end,
        desc = 'Trouble: Diagnostics (workspace)'
      },
      {
        '<leader>xX',
        function() require('trouble').toggle({ mode = 'diagnostics', filter = { buf = 0 } }) end,
        desc = 'Trouble: Diagnostics (buffer)'
      },
      {
        '<leader>xs',
        function() require('trouble').toggle('symbols') end,
        desc = 'Trouble: Symbols'
      },
      {
        '<leader>xl',
        function() require('trouble').toggle('lsp') end,
        desc = 'Trouble: LSP'
      },
      {
        '<leader>xL',
        function() require('trouble').toggle('loclist') end,
        desc = 'Trouble: Location List'
      },
      {
        '<leader>xQ',
        function() require('trouble').toggle('qflist') end,
        desc = 'Trouble: Quickfix List'
      },
    },
    config = function(_, opts)
      local trouble = require('trouble')
      trouble.setup(opts)

      -- Auto-open Trouble on save if buffer has errors
      local grp = vim.api.nvim_create_augroup('TroubleAutoOpenOnError', { clear = true })
      vim.api.nvim_create_autocmd('BufWritePost', {
        group = grp,
        callback = function()
          local errs = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
          if #errs > 0 then
            -- Only open if not already open; ignore errors if API differs
            local ok, is_open = pcall(function() return trouble.is_open() end)
            if not ok or not is_open then
              pcall(trouble.open, 'diagnostics')
            end
          end
        end,
      })
    end,
  },
}
