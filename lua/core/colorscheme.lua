local M = {

  midnight = function()
    vim.g.nb_disable_background = false
    vim.g.nb_italic_comments = true
    vim.g.nb_italic_keywords = true
    vim.g.nb_italic_functions = true
    vim.g.nb_italic_variables = false
    vim.g.nb_style = 'midnight'

    require('nebulous').setup()
  end,
  onedark = function()
    require('onedark').setup({
      commentStyle = 'italic',
      keywordStyle = 'italic',
      functionStyle = 'italic',
      variableStyle = 'italic',
      sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' },
      -- ... your onedark config
    })
  end,
  night = function()
    vim.g.tokyonight_style = 'night'
    vim.g.tokyonight_italic_functions = true
    vim.g.tokyonight_italic_comments = true
    vim.g.tokyonight_sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' }
    vim.cmd([[colorscheme tokyonight]])
  end,

  storm = function()
    vim.g.tokyonight_style = 'storm'
    vim.g.tokyonight_italic_functions = true
    vim.g.tokyonight_italic_comments = true
    vim.g.tokyonight_sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' }
    vim.cmd([[colorscheme tokyonight]])
  end,
  wind = function()
    vim.cmd([[colorscheme wind]])
  end,
  omni = function()
    vim.cmd([[colorscheme omni]])
  end,
  kos = function()
    require('kosmikoa')
  end,
  melange = function()
    vim.cmd('colorscheme melange')
  end,
  zephyr = function()
    require('zephyr')
  end,
  deep_ocean = function()
    vim.g.material_style = 'deep ocean'
    require('material').setup({

      contrast = true, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
      borders = false, -- Enable borders between verticaly split windows

      italics = {
        comments = false, -- Enable italic comments
        keywords = false, -- Enable italic keywords
        functions = false, -- Enable italic functions
        strings = false, -- Enable italic strings
        variables = false, -- Enable italic variables
      },

      contrast_windows = { -- Specify which windows get the contrasted (darker) background
        'terminal', -- Darker terminal background
        'packer', -- Darker packer background
        'qf', -- Darker qf list background
      },

      text_contrast = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = false, -- Enable higher contrast text for darker style
      },

      disable = {
        background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines = false, -- Hide the end-of-buffer lines
      },

      custom_highlights = {}, -- Overwrite highlights with your own
    })

    vim.cmd([[colorscheme material]])
  end,

  palenight = function()
    vim.g.material_style = 'palenight'
    require('material').setup({

      contrast = true, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
      borders = true, -- Enable borders between verticaly split windows

      italics = {
        comments = false, -- Enable italic comments
        keywords = false, -- Enable italic keywords
        functions = false, -- Enable italic functions
        strings = false, -- Enable italic strings
        variables = false, -- Enable italic variables
      },

      contrast_windows = { -- Specify which windows get the contrasted (darker) background
        'terminal', -- Darker terminal background
        'packer', -- Darker packer background
        'qf', -- Darker qf list background
      },

      text_contrast = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = false, -- Enable higher contrast text for darker style
      },

      disable = {
        background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines = false, -- Hide the end-of-buffer lines
      },

      custom_highlights = {}, -- Overwrite highlights with your own
    })

    vim.cmd([[colorscheme material]])
  end,
  pinkmore = function()
    vim.cmd([[colorscheme pinkmare]])
  end,
  gruvbox = function()
    vim.g.gruvbox_flat_style = 'dark'
    vim.g.gruvbox_flat_style = 'hard'
    vim.g.gruvbox_italic_comments = true
    vim.g.gruvbox_italic_functions = true
    vim.g.gruvbox_dark_sidebar = true
    vim.g.gruvbox_dark_float = true
    vim.g.gruvbox_hide_inactive_statusline = true
    vim.g.gruvbox_sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' }
    vim.cmd([[colorscheme gruvbox-flat]])
  end,
  nordfox = function()
    local nightfox = require('nightfox')
    nightfox.setup({
      fox = 'nordfox',
      styles = {
        comments = 'italic',
        keywords = 'bold',
        functions = 'italic,bold',
      },
    })

    nightfox.load()
  end,
  nightfox = function()
    local nightfox = require('nightfox')
    nightfox.setup({
      fox = 'nightfox',
      styles = {
        comments = 'italic',
        keywords = 'bold',
        functions = 'italic,bold',
      },
    })

    nightfox.load()
  end,

  palefox = function()
    local nightfox = require('nightfox')
    nightfox.setup({
      fox = 'palefox',
      styles = {
        comments = 'italic',
        keywords = 'bold',
        functions = 'italic,bold',
      },
    })

    nightfox.load()
  end,
}
return M
