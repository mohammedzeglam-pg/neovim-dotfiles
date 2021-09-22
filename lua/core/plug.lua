local use = require('packer').use
require('packer').startup(function()
  use({ 'wbthomason/packer.nvim' })

  use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = [[require("core.tree")]],
  })
  use({
    'akinsho/nvim-toggleterm.lua',
    config = function()
      require('core.term')
    end,
  })
  use({
    'editorconfig/editorconfig',
    setup = function()
      vim.g.EditorConfig_exclude_patterns = {
        'fugitive://.*',
        'scp://.*',
      }
    end,
  })

  use({
    'nvim-treesitter/nvim-treesitter',
    config = [[require'core.treesitter']],
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/playground',
      'p00f/nvim-ts-rainbow',
      'windwp/nvim-ts-autotag',
    },
  })

  use({
    'nvim-lua/plenary.nvim',
    module = 'plenary',
  })
  use({
    {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-telescope/telescope-frecency.nvim',
      },
      module = 'telescope',
      setup = [[require('core.telescope')]],
    },
    {
      'nvim-telescope/telescope-frecency.nvim',
      config = function()
        require('telescope').load_extension('frecency')
      end,
      after = 'telescope.nvim',
      requires = 'tami5/sql.nvim',
    },
  })

  use({
    'johnpapa/vscode-angular-snippets',
  })

  use({
    'ray-x/lsp_signature.nvim',
  })
  use({
    'neovim/nvim-lspconfig',
    config = [[require('mode').load()]],
  })

  use({
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({
        disable_filetype = { 'TelescopePrompt', 'vim' },
      })
      require('nvim-autopairs.completion.cmp').setup({
        map_cr = true, --  map <CR> on insert mode
        map_complete = true, -- it will auto insert `(` after select function or method item
        auto_select = true, -- automatically select the first item
      })
    end,
  })
  use({
    'terrortylor/nvim-comment',
    config = [[require('nvim_comment').setup()]],
  })

  use({
    'simrat39/rust-tools.nvim',
    ft = 'rust',
    config = function()
      require('rust-tools').setup({})
    end,
  })
  use({
    'akinsho/flutter-tools.nvim',
  })

  use({
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('mode.format')
    end,
    requires = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  })
  use({
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('core.todo')
    end,
  })

  use({
    'jose-elias-alvarez/nvim-lsp-ts-utils',
  })

  use({
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('core.icon')
    end,
  })
  use({ 'mfussenegger/nvim-dap' })
  use({ 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } })
  use({ 'nvim-telescope/telescope-dap.nvim' })
  use({ 'theHamsta/nvim-dap-virtual-text' })

  use({
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('neogit').setup({})
    end,
  })

  use({
    'folke/lua-dev.nvim',
  })
  use({
    'hrsh7th/nvim-cmp',
    config = function()
      require('core/cmp')
    end,
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      { 'tzachar/cmp-tabnine', run = './install.sh' },
      'ray-x/cmp-treesitter',
    },
  })

  use('rafamadriz/friendly-snippets')
  use({
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      -- vim.opt.termguicolors = true
      -- vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 blend=nocombine]])
      -- vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B blend=nocombine]])
      -- vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 blend=nocombine]])
      -- vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 blend=nocombine]])
      -- vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF blend=nocombine]])
      -- vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD blend=nocombine]])

      require('indent_blankline').setup({
        buftype_exclude = { 'terminal', 'NvimTree', 'Telescope', 'packer' },
        show_end_of_line = true,
        space_char_blankline = ' ',
        show_current_context = true,
        -- char_highlight_list = {
        -- 	"IndentBlanklineIndent1",
        -- 	"IndentBlanklineIndent2",
        -- 	"IndentBlanklineIndent3",
        -- 	"IndentBlanklineIndent4",
        -- 	"IndentBlanklineIndent5",
        -- 	"IndentBlanklineIndent6",
        -- },
      })
    end,
  })
  use({
    '/windwp/windline.nvim',
    config = function()
      require('wlsample.evil_line')
    end,
  })

  -- use('~/dev/nvim/zephyr-nvim')
  use({ 'mohammedzeglam-pg/casillias-nvim', require = 'nvim-treesitter/nvim-treesitter' })
  use({
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({
        '*',
      }, { mode = 'foreground' })
    end,
  })

  use('PhilT/vim-fsharp')
  use('adelarsq/neofsharp.vim')
  use({
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  })

  use('NTBBloodbath/doom-one.nvim')
  use('LunarVim/Colorschemes')
  use('ray-x/material_plus.nvim')
end)
