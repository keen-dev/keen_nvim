return {
  {
    "folke/twilight.nvim",
    config = function()
      vim.keymap.set('n', '<leader>ft', ':Twilight<CR>', { silent = true, desc = '[T]oggle [T]wilight' })
    end
  }
}
