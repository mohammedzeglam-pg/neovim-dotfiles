local util = require('mode.util')
local conf = util.conf()
conf.fsautocomplete.setup({
  on_attach = function(client, bufnr)
    util.on_attach(client, bufnr, false)
  end,
  capabilities = util.capabilities,
  flags = util.flags,
  settings = {
    FSharp = {
      keywordsAutocomplete = true,
    },
    -- ['FSharp.keywordsAutocomplete'] = true,
  },
})
