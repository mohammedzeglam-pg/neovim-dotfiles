local M = {}

M.on_attach = function(client, bufnr, dis_fmt)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  require('mode.keymap')(bufnr)
  M.inhancelsp()
  require('lsp_signature').on_attach({
    bind = true,
    use_lspsaga = true,
    doc_lines = 5,
    floating_window = true,
    hint_enable = false,
    handler_opts = { border = 'rounded' },
    extra_trigger_chars = { '(', ',' },
    fix_pos = 'single',
  }, bufnr)
  if dis_fmt == true or dis_fmt == nil then
    client.resolved_capabilities.document_formatting = false
  end
end
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown' }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.insertTextModeSupport = { valueSet = {} } --TODO
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  },
}

M.capabilities = capabilities

M.inhancelsp = function()
  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = '»',
      spacing = 4,
    },
    update_in_insert = true,
    signs = true,
  })
  vim.fn.sign_define('LspDiagnosticsSignError', { text = '', texthl = 'LspDiagnosticsDefaultError' })
  vim.fn.sign_define('LspDiagnosticsSignWarning', { text = '', texthl = 'LspDiagnosticsDefaultWarning' })
  vim.fn.sign_define('LspDiagnosticsSignInformation', { text = '', texthl = 'LspDiagnosticsDefaultInformation' })
  vim.fn.sign_define('LspDiagnosticsSignHint', { text = '', texthl = 'LspDiagnosticsDefaultHint' })
end
M.flags = {
  debounce_text_changes = 150,
}
M.conf = function()
  return require('lspconfig')
end
return M
