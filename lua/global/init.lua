--@Param scheme string
--@Param scheme number
_G.set_theme = function(scheme)
  if type(scheme) == 'number' then
    --FIXME:
    local schemes = vim.tbl_keys(require('core.colorscheme'))
    scheme = schemes[scheme]
  end
  local theme = require('core.colorscheme')[scheme]
  if type(theme) == 'function' then
    theme()
  end
end
--@Param cmd_name string
--@Param args number
--@Param do_thing string
_G.set_command = function(cmd_name, args, do_thing)
  local num = args or 0
  if cmd_name == nil and do_thing == nil then
    return
  end
  vim.cmd('command! -nargs=' .. num .. ' ' .. cmd_name .. ' ' .. do_thing)
end
