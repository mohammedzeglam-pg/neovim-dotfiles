local opt = vim.opt

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
