-- Mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
-- buf_set_keymap("n", "<space>f", ":lua vim.lsp.buf.formatting()<CR>", opts)
return function(bufnr)
  local keys = {
    { 'n', 'gD', ':lua vim.lsp.buf.declaration()<CR>' },
    { 'n', 'gd', ':lua vim.lsp.buf.definition()<CR>' },
    { 'n', 'K', ':lua vim.lsp.buf.hover()<CR>' },
    { 'n', 'gh', ':lua vim.lsp.buf.references()<CR>' },
    { 'n', 'gi', ':lua vim.lsp.buf.implementation()<CR>' },
    -- { 'n', 'gi', ':Telescope lsp_implementations<CR>' },
    { 'n', 'gs', ':lua vim.lsp.buf.signature_help()<CR>' },
    { 'n', '<space>wa', ':lua vim.lsp.buf.add_workspace_folder()<CR>' },
    { 'n', '<space>wr', ':lua vim.lsp.buf.remove_workspace_folder()<CR>' },
    { 'n', '<space>wl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>' },
    { 'n', '<space>D', ':lua vim.lsp.buf.type_definition()<CR>' },
    { 'n', 'gr', ':lua vim.lsp.buf.rename()<CR>' },
    { 'n', 'ca', ':lua vim.lsp.buf.code_action()<CR>' },
    { 'v', 'ca', '<C-U>: lua vim.lsp.buf.range_code_action()<CR>' },
    { 'n', '<space>gr', ':Telescope lsp_references<CR>' },
    { 'n', 'cd', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>' },
    { 'n', '[e', ':lua vim.lsp.diagnostic.diagnostic_jump_prev()<CR>' },
    { 'n', ']e', ':lua vim.lsp.diagnostic.diagnostic_jump_next()<CR>' },
    { 'n', '<space>q', ':lua vim.lsp.diagnostic.set_loclist()<CR>' },
  }
  require('core').key().set_buf(bufnr, keys)
end
