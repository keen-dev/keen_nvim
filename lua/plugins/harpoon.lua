return {
  {
    'ThePrimeagen/harpoon',
    event = 'VeryLazy',
    config = function()
      -- Harpoon Keymaps
      local mark = require('harpoon.mark')
      local ui = require('harpoon.ui')

      vim.keymap.set('n', '<A-;>', function() mark.add_file() end, { desc = 'Harpoon add file' })
      vim.keymap.set('n', '<A-h>', function() ui.toggle_quick_menu() end, { desc = '[H]arpoon quick menu' })
      vim.keymap.set('n', '<A-j>', function() ui.nav_prev() end, { desc = 'Harpoon Prev' })
      vim.keymap.set('n', '<A-k>', function() ui.nav_next() end, { desc = 'Harpoon Next' })
      vim.keymap.set('n', '<A-m>', function() ui.nav_file(1) end, { desc = 'Harpoon First Nav' })
      vim.keymap.set('n', '<A-,>', function() ui.nav_file(2) end, { desc = 'Harpoon Second Nav' })
      vim.keymap.set('n', '<A-.>', function() ui.nav_file(3) end, { desc = 'Harpoon Third Nav' })
      vim.keymap.set('n', '<A-/>', function() ui.nav_file(4) end, { desc = 'Harpoon Fourth Nav' })
    end
  }
}
