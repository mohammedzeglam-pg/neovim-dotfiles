local util = require('mode.util')
local conf = util.conf()
local system_name
if vim.fn.has('mac') == 1 then
  system_name = 'macOS'
elseif vim.fn.has('unix') == 1 then
  system_name = 'Linux'
elseif vim.fn.has('win32') == 1 then
  system_name = 'Windows'
else
  print('Unsupported system for sumneko')
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = vim.fn.stdpath('cache') .. '/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/' .. system_name .. '/lua-language-server'
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local luadev = require('lua-dev').setup({
  library = {
    vimruntime = true, -- runtime path
    types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
    plugins = true, -- installed opt or start plugins in packpath
    -- you can also specify the list of plugins to make available as a workspace library
    -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
    -- ["/usr/local/share/nvim/runtime/lua"] = true,
  },
  -- pass any additional options that will be merged in the final lsp config
  lspconfig = {
    on_attach = util.on_attach,
    cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
    capabilities = util.capabilities,
    flags = util.flags,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
          enable = true,
          -- Get the language server to recognize the `vim` global
          globals = {
            -- Nvim
            'vim',
            'use', -- Packer use keyword

            -- AwesomeWM
            -- "awesome",
            -- "client",
            -- "root",
          },
        },
        -- workspace = {
        --   -- 	-- Make the server aware of Neovim runtime files
        --   library = {
        --     -- 		-- vim.api.nvim_get_runtime_file("", true),
        --     -- ["/usr/local/share/nvim/runtime/lua"] = true,
        --     -- ["/usr/share/awesome/lib"] = true,
        --   },
        -- },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  },
})
conf.sumneko_lua.setup(luadev)
