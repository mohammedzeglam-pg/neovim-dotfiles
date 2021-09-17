local M = {}

M.opt = function(client, bufnr)
  --Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  require('mode.keymap')(bufnr)
  client.resolved_capabilities.document_formatting = false

  require('lsp_signature').on_attach({
    bind = true,
    doc_lines = 5,
    floating_window = true,
    hint_enable = false,
    handler_opts = { border = 'rounded' },
    extra_trigger_chars = { '(', ',' },
    fix_pos = 'single',
  }, bufnr)
  require('mode/ui')
end
M.cap = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown' }
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.preselectSupport = true
  capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
  capabilities.textDocument.completion.completionItem.deprecatedSupport = true
  capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
  capabilities.textDocument.completion.completionItem.insertTextModeSupport = { valueSet = {} } -- TODO
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    },
  }
  return capabilities
end
M.load = function()
  M.inhancelsp()
  require('mode/lua')(M.opt, M.cap)
  require('mode.angular')(M.opt, M.cap)
  require('mode.omnisharp')(M.opt, M.cap)
  require('mode.c')(M.opt, M.cap)
  require('mode.ts')(M.opt, M.cap)
  require('mode.vue')(M.opt, M.cap)
  require('mode.rust')(M.opt, M.cap)
  require('mode.html')(M.opt, M.cap)
  require('mode.css')(M.opt, M.cap)
  require('mode.haskell')(M.opt, M.cap)
  require('mode.php')(M.opt, M.cap)
  require('mode.go')(M.opt, M.cap)
  require('mode.emmet')
end
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
return function()
  return M
end
