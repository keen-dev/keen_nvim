return {
  'Exafunction/codeium.vim',
  config = function()
    vim.g.codeium_no_map_tab = true
    vim.g.codeium_disable_bindings = 1
    vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
    vim.keymap.set('i', '<C-l>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
    vim.keymap.set('i', '<C-S-l>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
    vim.keymap.set('i', '<C-e>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    vim.keymap.set('i', '<C-S-e>', function() return vim.fn['codeium#Toggle ']() end, { expr = true })
  end
}
