return {
  'Exafunction/codeium.vim',
  options = {
    codeium_disable_bindings = 1,
    codeium_no_map_tab = true,
  },
  event = 'InsertEnter',

  config = function()
    vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
    vim.keymap.set('i', '<C-l>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
    vim.keymap.set('i', '<C-S-l>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
    vim.keymap.set('i', '<C-e>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    vim.keymap.set('i', '<C-S-e>', function() return vim.fn['codeium#Toggle ']() end, { expr = true })
  end
}
