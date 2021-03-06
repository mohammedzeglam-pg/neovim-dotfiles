local util = require('mode.util')
local conf = util.conf()
local configs = require('lspconfig/configs')
configs.emmet_ls = {
  default_config = {
    cmd = { 'emmet-ls', '--stdio' },
    filetypes = { 'html', 'css' },
    root_dir = function()
      return vim.loop.cwd()
    end,
    settings = {},
  },
}

conf.emmet_ls.setup({
  on_attach = util.on_attach,
  capabilities = util.capabilities,
  flags = util.flags,
})
