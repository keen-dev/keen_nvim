-- Shim to provide position_encoding to vim.lsp.util.make_position_params
-- Neovim 0.11 requires callers to pass a position_encoding; some plugins
-- still omit it. This wrapper injects the encoding from the current buffer's
-- attached client(s) to avoid noisy warnings.

local util = vim.lsp and vim.lsp.util
if not util or type(util.make_position_params) ~= 'function' then
  return
end

local orig_make_position_params = util.make_position_params

local function get_offset_encoding(win)
  local ok, enc = pcall(function()
    local bufnr = vim.api.nvim_win_get_buf(win or 0)
    -- Prefer Neovim helper if available
    if util._get_offset_encoding then
      return util._get_offset_encoding(bufnr)
    end
    -- Fallback: inspect first attached client
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    return (clients[1] and (clients[1].offset_encoding or clients[1].position_encodings and clients[1].position_encodings[1]))
      or 'utf-16'
  end)
  return ok and enc or 'utf-16'
end

util.make_position_params = function(win, enc_or_opts)
  -- If caller already supplies encoding/options with encoding, leave as-is
  if type(enc_or_opts) == 'string' then
    return orig_make_position_params(win, enc_or_opts)
  elseif type(enc_or_opts) == 'table' and enc_or_opts.position_encoding then
    return orig_make_position_params(win, enc_or_opts)
  end

  -- Inject encoding automatically
  local enc = get_offset_encoding(win)
  -- Support both new (string) and opts table styles
  if type(enc_or_opts) == 'table' then
    enc_or_opts.position_encoding = enc_or_opts.position_encoding or enc
    return orig_make_position_params(win, enc_or_opts)
  else
    return orig_make_position_params(win, enc)
  end
end

