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
    'Julpikar/night-owl.nvim',
  })

  use({
    'johnpapa/vscode-angular-snippets',
  })

  use({
    'ray-x/lsp_signature.nvim',
  })
  use({
    'neovim/nvim-lspconfig',
    config = [[require('mode')().load()]],
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
    'folke/tokyonight.nvim',
  })
  use({
    'ful1e5/onedark.nvim',
  })
  use({
    'Yagua/nebulous.nvim',
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
    ft = 'dart',
    config = function()
      require('flutter-tools').setup({}) -- use defaults
    end,
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
  use({ 'windwp/wind-colors' })
  use({ 'yonlu/omni.vim' })

  use({
    'https://git.sr.ht/~novakane/kosmikoa.nvim',
  })
  use('savq/melange')
  use('glepnir/zephyr-nvim')
  use('matsuuu/pinkmare')

  use('marko-cerovac/material.nvim')
  use({
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({
        'css',
        'javascript',
        'html',
      }, { mode = 'foreground' })
    end,
  })

  use('eddyekofo94/gruvbox-flat.nvim')
  use('EdenEast/nightfox.nvim')
end)
