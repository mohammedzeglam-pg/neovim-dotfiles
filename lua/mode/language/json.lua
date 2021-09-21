local util = require('mode.util')
require('lspconfig').jsonls.setup({
  capabilities = util.capabilities,
})
