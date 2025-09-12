-- Shim deprecated vim.lsp.util.jump_to_location on Neovim 0.11+
-- Some plugins still call this function, which now warns on every call.
-- Provide a compatible implementation without emitting deprecation notices.

local util = vim.lsp and vim.lsp.util
if not util then return end

-- Only replace if the symbol exists (to avoid future breakage)
if type(util.jump_to_location) == 'function' then
  local function byte_from_pos(bufnr, pos, enc)
    local ok, col = pcall(function()
      if util._get_line_byte_from_position then
        return util._get_line_byte_from_position(bufnr, pos, enc or 'utf-16')
      end
      return pos.character or 0
    end)
    return ok and col or (pos.character or 0)
  end

  util.jump_to_location = function(location, enc_or_opts, reuse_win)
    -- Support old call styles: (location, encoding, reuse_win) or (location, { position_encoding = ..., reuse_win = ... })
    local enc = enc_or_opts
    if type(enc_or_opts) == 'table' then
      enc = enc_or_opts.position_encoding or enc_or_opts.offset_encoding or enc_or_opts.encoding
      reuse_win = enc_or_opts.reuse_win
    end

    if not location then return end
    local uri = location.uri or location.targetUri
    if not uri then return end

    local bufnr = vim.uri_to_bufnr(uri)
    if not vim.api.nvim_buf_is_loaded(bufnr) then
      pcall(vim.fn.bufload, bufnr)
    end

    local range = location.range or location.targetRange or location.targetSelectionRange or location.selectionRange
    if not range then
      -- No range provided; just open the buffer
      pcall(vim.api.nvim_set_current_buf, bufnr)
      return bufnr
    end

    local start = range.start
    local row = start.line or 0
    local col = byte_from_pos(bufnr, start, enc)

    -- Always use current window; if callers want splits they can manage it.
    -- This mirrors common usage of the deprecated API when reuse_win=true.
    pcall(vim.api.nvim_set_current_buf, bufnr)
    pcall(vim.api.nvim_win_set_cursor, 0, { row + 1, col })
    return bufnr
  end
end

