require('telescope').setup({
  pickers = {
    find_files = {
      theme = 'dropdown',
    },
    file_browser = {
      theme = 'ivy',
    },
    fd = {
      theme = 'ivy',
    },
    grep_string = {
      theme = 'dropdown',
    },
    lsp_code_actions = {
      theme = 'cursor',
    },
  },
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
    prompt_prefix = '> ',
    selection_caret = '> ',
    entry_prefix = '  ',
    initial_mode = 'insert',
    selection_strategy = 'reset',
    sorting_strategy = 'descending',
    layout_strategy = 'horizontal',
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    winblend = 20,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = false,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
  },
  extensions = {
    frecency = {
      db_root = 'home/mzerone/.config/nvim/',
      show_scores = false,
      show_unindexed = true,
      ignore_patterns = { '*.git/*', '*/tmp/*' },
      disable_devicons = false,
      workspaces = {
        ['conf'] = '/home/mzerone/.config',
        ['data'] = '/home/mzerone/.local/share',
        ['project'] = '/home/mzerone/projects',
        ['wiki'] = '/home/mzerone/wiki',
      },
    },
  },
})

require('telescope').load_extension('dap')
local key = require('core').key
local keys = {
  { 'n', '<leader>.', ':Telescope fd<cr>' },
  { 'n', '<leader><leader>', ':Telescope live_grep<cr>' },
  { 'n', '<leader>bB', ':Telescope buffers<cr>' },
  { 'n', '<leader>fh', ':Telescope help_tags<cr>' },
}
key.add(keys)
