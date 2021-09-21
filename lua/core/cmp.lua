-- nvim-cmp setup
local cmp = require('cmp')
local kind = {
  Text = '',
  Method = '',
  Function = '',
  Constructor = '',
  Field = '',
  Variable = '',
  Class = '',
  Interface = 'ﰮ',
  Module = '',
  Property = '',
  Unit = '',
  Value = '',
  Enum = '了',
  Keyword = '',
  Snippet = '﬌',
  Color = '',
  File = '',
  Reference = '',
  Folder = '',
  EnumMember = '',
  Constant = '',
  Struct = '',
  Event = '',
  Operator = 'ﬦ',
  TypeParameter = '',
}
local check_back_space = function()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end
local luasnip = require('luasnip')

require('luasnip.loaders.from_vscode').lazy_load() -- opts can be ommited
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
cmp.setup({
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  preselect = 'always',
  formatting = {
    format = function(entry, vim_item)
      if entry.source.name == 'cmp_tabnine' then
        print(vim.inspect(entry.source.name))
        print(vim_item.kind)
      end
      vim_item.kind = kind[vim_item.kind] or ''
      return vim_item
    end,
  },
  documentation = {
    border = 'rounded',
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(t('<C-n>'), 'n')
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(t('<Plug>luasnip-expand-or-jump'), '')
      elseif check_back_space() then
        vim.fn.feedkeys(t('<Tab>'), 'n')
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(t('<C-p>'), 'n')
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(t('<Plug>luasnip-jump-prev'), '')
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
  },
  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'vsnip' },
    { name = 'emoji' },
    { name = 'nvim_lua' },
    { name = 'cmp_tabnine' },
    { name = 'treesitter' },
  },
})
local tabnine = require('cmp_tabnine.config')
tabnine:setup({
  max_lines = 1000,
  max_num_results = 20,
  sort = true,
})
