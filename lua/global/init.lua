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
  args = args or 0
  if cmd_name == nil and do_thing == nil then
    return
  end
  vim.cmd('command! -nargs=' .. args .. ' ' .. cmd_name .. ' ' .. do_thing)
end
--@Param wait num
--@Param repeat num
function _G.Colors_Loop(wait, repeat_after)
  wait = wait or 3000
  repeat_after = repeat_after or 3000
  local schemes = require('core.colorscheme')
  local names = vim.tbl_keys(schemes)
  local colors = vim.tbl_count(schemes)
  local idx = 1
  local timer = vim.loop.new_timer()
  timer:start(
    wait,
    repeat_after,
    vim.schedule_wrap(function()
      set_theme(idx)
      if idx > colors then
        print('stopped')
        timer:close()
      end
      print(names[idx])
      idx = idx + 1
    end)
  )
end
