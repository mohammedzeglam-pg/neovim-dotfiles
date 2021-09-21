local M = {}
vim.g.mapleader = ' '

M.keys = {
  { 'n', 'Y', 'y$' },
  { 'i', '<C-u>', '<C-g>u<C-u>' },
  { 'i', '<C-w>', '<C-g>u<C-w>' },
  -- { "i", "<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', { expr = true, noremap = true, silent = true } },
  -- { "i", "<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true, noremap = true, silent = true } },
  { 'n', '<C-l>', ':noh<CR>' },
  { 'n', '<leader>o', 'm`o<Esc>``' },
  { 'n', 'n', 'nzzzv' },
  { 'n', 'N', 'Nzzzv' },
  { 'n', 'J', 'mzJ`z' },
  { 'v', 'K', ":m '<-2<CR>gv=gv" },
  { 'v', 'J', ":m '>+1<CR>gv=gv" },
  { 'n', '<c-t>', [[:exe v:count1 . "ToggleTerm"<CR>]] },
  { 'i', '<c-t>', [[<Esc>:exe v:count1 . "ToggleTerm"<CR>]] },
  { 'n', '[b', ':BufferLineCycleNext<CR>' },
  { 'n', 'b]', ':BufferLineCyclePrev<CR>' },
  { 'n', 'bb', ':lua require("core.tabline") <CR>' },
}

M.add = function(tbl)
  for _, v in ipairs(tbl) do
    table.insert(M.keys, v)
  end
end

M.load = function()
  for _, v in ipairs(M.keys) do
    if v[4] == nil then
      v[4] = { noremap = true, silent = true }
    end
    vim.api.nvim_set_keymap(v[1], v[2], v[3], v[4])
  end
end
M.set = function(tbl)
  for _, v in ipairs(tbl) do
    table.insert(M.keys, v)
  end
end
M.set_buf = function(bufnr, tbl)
  if type(tbl) ~= 'table' then
    return error('check keys', 0)
  end
  for _, v in ipairs(tbl) do
    if v[4] == nil then
      v[4] = { noremap = true, silent = true }
    end
    vim.api.nvim_buf_set_keymap(bufnr, v[1], v[2], v[3], v[4])
  end
end
return M
