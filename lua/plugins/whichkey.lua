return {

  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        }
      },
      -- window = {
      --   border = 'single',
      -- },

      key_labels = {
        ['<leader>'] = 'SPC',

      },
    },

    config = function()
      local wk = require 'which-key'
      wk.add({
        { '<leader>c', group = 'Code' },
        { '<leader>d', group = 'Document' },
        { '<leader>g', group = 'Git' },
        { '<leader>h', group = 'More Git' },
        { '<leader>r', group = 'Rename' },
        { '<leader>s', group = 'Search' },
        { '<leader>w', group = 'Workspace/Window' },
        { '<leader>t', group = 'Terminal' },
        { '<leader>p', group = 'Project Finder' },
        { '<leader>f', group = 'Formatting' },
      })
      -- ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      -- ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      -- ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      -- -- ['<leader>h'] = { name = 'More git', _ = 'which_key_ignore' },
      -- ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      -- ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      -- ['<leader>w'] = { name = '[W]orkspace/Window', _ = 'which_key_ignore' },
      -- ['<leader>t'] = { name = '[T]erminal', _ = 'which_key_ignore' },
      -- ['<leader>p'] = { name = 'Project Finder', _ = 'which_key_ignore' },
      -- ['<leader>f'] = { name = 'Formatting', _ = 'which_key_ignore' },
    end
  }
}
