return {
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- See `:help lualine.txt`
    opts = {
      options = {
        theme = 'catppuccin',
        icons_enabled = true,
        -- component_separators = '|',
        -- section_separators = '',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
          {
            'filename',
            path = 1,
          },
        },
        lualine_x = {
          {
            function()
              local ok, noice = pcall(require, 'noice')
              if not ok then return '' end
              return noice.api.statusline.mode.get()
            end,
            cond = function()
              local ok, noice = pcall(require, 'noice')
              return ok and noice.api.statusline.mode.has()
            end,
            color = { fg = '#ff9e64' },
          },
          'fileformat',
          'filetype',
        },
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
