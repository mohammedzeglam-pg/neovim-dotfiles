local M = {
  casillias = function()
    require('casillias')
  end,
  doom = function()
    vim.cmd('colorscheme doom-one')
    vim.g.cursor_coloring = true
  end,
  aurora = function()
    vim.cmd('colorscheme aurora')
  end,

  codemonkey = function()
    vim.cmd('colorscheme codemonkey')
  end,

  onedarker = function()
    vim.cmd('colorscheme onedarker')
  end,

  darkplus = function()
    vim.cmd('colorscheme darkplus')
  end,

  spacedark = function()
    vim.cmd('colorscheme spacedark')
  end,

  system76 = function()
    vim.cmd('colorscheme system76')
  end,
  early = function()
    vim.g.material_style = 'earlysummer'
    require('material').set()
  end,
  dracula = function()
    vim.g.material_style = 'dracula'
    require('material').set()
  end,

  dracula_blood = function()
    vim.g.material_style = 'dracula_blood'
    require('material').set()
  end,

  darker = function()
    vim.g.material_style = 'darker'
    require('material').set()
  end,

  palenight = function()
    vim.g.material_style = 'palenight'
    require('material').set()
  end,

  oceanic = function()
    vim.g.material_style = 'oceanic'
    require('material').set()
  end,

  deep = function()
    vim.g.material_style = 'deep ocean'
    require('material').set()
  end,

  moonlight = function()
    vim.g.material_style = 'moonlight'
    require('material').set()
  end,

  monokai = function()
    vim.g.material_style = 'monokai'
    require('material').set()
  end,

  emerald = function()
    vim.g.material_style = 'emerald'
    require('material').set()
  end,
  middlenight = function()
    vim.g.material_style = 'middlenight_blue'
    require('material').set()
  end,
  themes = {
    'middlenight_blue',
  },
}
return M
