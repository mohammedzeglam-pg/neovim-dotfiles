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
}
return M
