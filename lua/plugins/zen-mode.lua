return {
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Zen Mode" })
      }
    end
  }
}
