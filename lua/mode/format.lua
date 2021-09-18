local null_ls = require('null-ls')
null_ls.config({
  sources = {
    -- null_ls.builtins.diagnostics.write_good,
    -- null_ls.builtins.code_actions.gitsigns,
    -- null_ls.builtins.formatting.black,
    -- null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.cmake_format,
    -- null_ls.builtins.formatting.dart_format,
    -- null_ls.builtins.formatting.deno_fmt,
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.gofumpt,
    -- null_ls.builtins.formatting.isort,
    -- null_ls.builtins.formatting.json_tool,
    -- null_ls.builtins.formatting.lua_format,
    -- null_ls.builtins.formatting.phpcbf,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.stylua,
    -- null_ls.builtins.formatting.uncrustify,
    -- null_ls.builtins.formatting.yapf,
    -- null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.diagnostics.luacheck,
    null_ls.builtins.diagnostics.markdownlint,
    -- null_ls.builtins.diagnostics.pylint,
    -- null_ls.builtins.diagnostics.misspell,
    -- null_ls.builtins.diagnostics.selene,
  },
})
require('lspconfig')['null-ls'].setup({
  -- on_attach = require("mode").opt
  on_attach = function(client, bufnr)
    if client.resolved_capabilities.document_formatting then
      vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()')
    end
  end,
})
