require('core.settings')
-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure plugins ]]
-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
--


require('lazy').setup({
  -- NOTE: First, some plugins that don't require any configuration
  { import = 'plugins' },
}, {})

require('core.keymaps')

-- Initialize plugin configs
require("cmp").setup({
  formatting = { format = require("tailwindcss-colorizer-cmp").formatter }
})

require 'lspconfig'.svelte.setup {}
require 'lspconfig'.pyright.setup {}


-- local custom_onedark = require('lualine.themes.onedark')
-- custom_onedark.normal.c.fg = '#f96743'
--
-- require('lualine').setup {
--   options = {
--     theme = custom_onedark
--   }
-- }
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
