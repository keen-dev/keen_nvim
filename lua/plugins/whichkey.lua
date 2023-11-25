return {

  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    opts = {},
    config = function()
      -- document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
        -- ['<leader>h'] = { name = 'More git', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace/Window', _ = 'which_key_ignore' },
        ['<leader>t'] = { name = '[T]erminal', _ = 'which_key_ignore' },
        ['<leader>p'] = { name = 'Project Finder', _ = 'which_key_ignore' },
        ['<leader>f'] = { name = 'Formatting', _ = 'which_key_ignore' },
      }
    end
  }
}
