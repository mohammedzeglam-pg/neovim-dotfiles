_G.set_theme = function(scheme)
  if type(scheme) == 'number' then
    --FIXME:
    local schemes = { 'midnight', 'onedark', 'night', 'storm', 'wind', 'omni', 'kos', 'melange', 'zephyr', 'deep_ocean', 'palenight', 'pinkmore', 'gruvbox', 'nordfox', 'nightfox', 'palefox' }
    scheme = schemes[scheme]
  end
  local theme = require('core.colorscheme')[scheme]
  if type(theme) == 'function' then
    theme()
  end
end
