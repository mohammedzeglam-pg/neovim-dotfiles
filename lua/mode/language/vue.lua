local util = require('mode.util')
local conf = util.conf()
conf.vuels.setup({
  on_attach = util.on_attach,
  capabilities = util.capabilities,
  flags = util.flags,
})
