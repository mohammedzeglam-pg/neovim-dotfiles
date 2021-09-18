local pid = vim.fn.getpid()
local util = require('mode.util')
require('lspconfig').omnisharp.setup({
  cmd = {
    '/home/mzerone/.cache/nvim/lspconfig/omnisharp/server/v1.37.5/run',
    '--languageserver',
    '--hostPID',
    tostring(pid),
  },

  on_attach = function(client, bufnr)
    util.on_attach(client, bufnr, false)
  end,
  capabilities = util.capabilities,
  flags = util.flags,
})
