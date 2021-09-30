local key = require('core.keymap')

local M = {
  key = key,
}

M.default = function()
  require('core.default')
  require('core.plug')
  require('core.util')
  require('debugger')
  require('global')
  require('core.command')
  vim.schedule(function()
    M.key.load()
  end)
end

return M
