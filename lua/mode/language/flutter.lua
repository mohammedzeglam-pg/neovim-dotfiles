local util = require('mode.util')
require('flutter-tools').setup({
  ui = {
    border = 'rounded',
  },
  decorations = {
    statusline = {
      app_version = true,
      device = true,
    },
  },
  debugger = { -- integrate with nvim dap + install dart code debugger
    enabled = true,
  },
  flutter_path = '/opt/flutter/bin/flutter', -- <-- this takes priority over the lookup
  -- flutter_lookup_cmd = '/opt/flutter/bin/flutter', -- example "dirname $(which flutter)" or "asdf where flutter"
  widget_guides = {
    enabled = false,
  },
  closing_tags = {
    highlight = 'ErrorMsg', -- highlight for the closing tag
    prefix = '->', -- character to use for close tag e.g. > Widget
    enabled = true, -- set to false to disable
  },
  dev_log = {
    open_cmd = 'tabedit', -- command to use to open the log buffer
  },
  dev_tools = {
    autostart = false, -- autostart devtools server if not detected
    auto_open_browser = false, -- Automatically opens devtools in the browser
  },
  outline = {
    open_cmd = '30vnew', -- command to use to open the outline buffer
    auto_open = false, -- if true this will open the outline automatically when it is first populated
  },
  lsp = {
    on_attach = util.on_attach,
    capabilities = util.capabilities,
    flags = util.flags,
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
    },
  },
})
