local opt, g = vim.opt, vim.g

opt.clipboard = 'unnamedplus'
opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
opt.expandtab = true
opt.hidden = true
opt.ignorecase = true
opt.joinspaces = false
opt.list = false
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.shiftround = true
opt.shiftwidth = 2
opt.sidescrolloff = 8
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
--opt.wildmode = {'list', 'longest'}
opt.wrap = false
opt.encoding = 'UTF-8'
opt.guifont = 'FantasqueSansMono Nerd Font:h10'
opt.wildignore:append({ '*.pyc', 'node_modules', 'obj', 'bin' })
opt.listchars = { tab = '>~', space = '⋅', eol = '↴' }
opt.colorcolumn = '80'
opt.cursorline = true
opt.foldcolumn = '2'
opt.mouse = 'a'

g.mapleader = ' '
-- ColorScheme
g.transparent_background = false
g.italic_comments = true
g.italic_keywords = true
g.italic_functions = true
g.italic_variables = true

-- x-ray
g.material_italic_comments = true
g.material_italic_string = false
g.material_italic_keywords = true
g.material_italic_functions = false
g.material_italic_variables = false
g.material_contrast = true
g.material_borders = false
g.material_disable_background = false
g.material_style_fix = true
g.material_darker_contrast = true
g.material_italic_keywords = false
g.material_italic_functions = false
--dashboard

g.indentLine_fileTypeExclude = { 'dashboard' }

--neovide

g.neovide_no_idle = true
g.neovide_fullscreen = true
g.neovide_cursor_animation_length = 0.13
g.neovide_cursor_antialiasing = true
g.neovide_cursor_trail_length = 0.8
g.neovide_remember_window_size = true
g.neovide_cursor_vfx_mode = 'ripple'
