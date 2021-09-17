local M = {}

M.key = function()
  return require('core.keymap')
end
M.default = function()
  require('core.default')
  require('core.plug')
  require('core.util')
  require('debugger')
  require('global')
  vim.schedule(function()
    M.key().load()
  end)
end

return M
