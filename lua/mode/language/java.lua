local util = require('mode.util')
local conf = util.conf()
conf.java_language_server.setup({
  cmd = { 'java-language-server' },
  on_attach = util.on_attach,
  capabilities = util.capabilities,
  flags = util.flags,
})
