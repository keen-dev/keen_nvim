return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    event = 'VeryLazy',
    opts = {
      ensure_installed = {
        -- LSP servers
        'pyright',
        'typescript-language-server',
        'css-lsp',
        'html-lsp',
        'json-lsp',
        'emmet-ls',
        'tailwindcss-language-server',
        'eslint-lsp',
        'bash-language-server',
        'lua-language-server',
        'svelte-language-server',

        -- Formatters / Linters used by conform
        'prettier',
        'stylua',
        'isort',
        'black',

        -- DAP
        'delve',
      },
      run_on_start = true,
      start_delay = 50, -- ms
      debounce_hours = 12,
    },
    config = function(_, opts)
      require('mason').setup() -- ensure mason is initialized
      require('mason-tool-installer').setup(opts)
    end,
  },
}
