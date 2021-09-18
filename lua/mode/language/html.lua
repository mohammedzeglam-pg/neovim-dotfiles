local util = require('mode.util')
local conf = util.conf()
conf.html.setup({
  on_attach = util.on_attach,
  capabilities = util.capabilities,
  flags = util.flags,
})
