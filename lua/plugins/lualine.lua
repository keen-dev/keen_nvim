return {
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- See `:help lualine.txt`
    opts = {
      theme = 'custom_onedark',
      -- options = {
      icons_enabled = true,
      -- theme = 'onedark',
      -- component_separators = '|',
      -- section_separators = '',
      -- },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
          {
            'filename',
            path = 1,
          },
        },
        lualine_x = { 'fileformat', 'filetype' },
        lualine_y = { 'filetype', 'fileformat', { 'searchcount', maxcount = 999, timeout = 500 } },
        lualine_z = { 'progress' },

      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = {},
        lualine_y = { 'filetype' },
        lualine_z = { { 'datetime', format = '%H:%M' } },
      },

    },
    -- config = function()
    --   local custom_onedark = require('lualine.themes.onedark')
    --   custom_onedark.normal.c.fg = '#f59661'
    --   custom_onedark.inactive.c.fg = '#f59661'
    --
    --   require('lualine').setup {
    --     options = {
    --       theme = custom_onedark
    --     }
    --   }
    -- end

  }
}
