-- Global, robust LSP navigation mappings with safe fallbacks

local function has_lsp(bufnr, method)
  for _, c in ipairs(vim.lsp.get_clients({ bufnr = bufnr or 0 })) do
    if c.supports_method and c:supports_method(method) then
      return true
    end
  end
  return false
end

local function try_telescope(fn)
  local ok, tb = pcall(require, 'telescope.builtin')
  if ok and type(tb[fn]) == 'function' then
    tb[fn]()
    return true
  end
  return false
end

local function goto_definition()
  if has_lsp(0, 'textDocument/definition') then
    if not try_telescope('lsp_definitions') then
      vim.lsp.buf.definition()
    end
  else
    -- Fallback to Vim's builtin local declaration
    vim.cmd('normal! gd')
  end
end

local function goto_references()
  if has_lsp(0, 'textDocument/references') then
    if not try_telescope('lsp_references') then
      vim.lsp.buf.references()
    end
  else
    vim.notify('No LSP client attached for references', vim.log.levels.WARN)
  end
end

local function goto_implementation()
  if has_lsp(0, 'textDocument/implementation') then
    if not try_telescope('lsp_implementations') then
      vim.lsp.buf.implementation()
    end
  else
    vim.notify('No LSP client attached for implementation', vim.log.levels.WARN)
  end
end

local function goto_declaration()
  if has_lsp(0, 'textDocument/declaration') then
    vim.lsp.buf.declaration()
  else
    vim.notify('No LSP client attached for declaration', vim.log.levels.WARN)
  end
end

vim.keymap.set('n', 'gd', goto_definition, { desc = 'Goto Definition' })
vim.keymap.set('n', 'gr', goto_references, { desc = 'Goto References' })
vim.keymap.set('n', 'gI', goto_implementation, { desc = 'Goto Implementation' })
vim.keymap.set('n', 'gD', goto_declaration, { desc = 'Goto Declaration' })

