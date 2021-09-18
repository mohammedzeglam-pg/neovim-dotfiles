local util = require('mode.util')
local conf = util.conf()
conf.rust_analyzer.setup({
  on_attach = util.on_attach,
  capabilities = util.capabilities,
  flags = util.flags,
})
