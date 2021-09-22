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
opt.guifont = 'FantasqueSansMono Nerd Font:h8'
opt.wildignore:append({ '*.pyc', 'node_modules', 'obj', 'bin' })
opt.listchars = { tab = '>~', space = '⋅', eol = '↴' }
opt.colorcolumn = '80'
opt.cursorline = true
opt.background = 'dark'
-- ColorScheme
g.transparent_background = false
g.italic_comments = true
g.italic_keywords = true
g.italic_functions = true
g.italic_variables = true

-- x-ray
vim.g.material_italic_comments = true
vim.g.material_italic_string = false
vim.g.material_italic_keywords = true
vim.g.material_italic_functions = false
vim.g.material_italic_variables = false
vim.g.material_contrast = true
vim.g.material_borders = false
vim.g.material_disable_background = false
vim.g.material_style_fix = true
vim.g.material_darker_contrast = true
vim.g.material_italic_keywords = false
vim.g.material_italic_functions = false
