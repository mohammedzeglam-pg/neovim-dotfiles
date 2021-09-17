return function(opt, cap)
  local pid = vim.fn.getpid()
  require('lspconfig').omnisharp.setup({
    cmd = {
      '/home/mzerone/.cache/nvim/lspconfig/omnisharp/server/v1.37.5/run',
      '--languageserver',
      '--hostPID',
      tostring(pid),
    },
    capabilities = cap(),
    -- on_attach = function(client, bufnr)
    -- 	opt(client, bufnr)
    -- 	if client.resolved_capabilities.document_formatting then
    -- 		vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
    -- 	end
    -- end,
    on_attach = function(client, bufnr)
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      -- require("lsp_signature").on_attach()

      require('lsp_signature').on_attach({
        bind = true,
        doc_lines = 5,
        floating_window = true,
        hint_enable = false,
        handler_opts = { border = 'rounded' },
        extra_trigger_chars = { '(', ',' },
        fix_pos = 'single',
      }, bufnr)

      require('mode.keymap')(bufnr)
      if client.resolved_capabilities.document_formatting then
        vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
      end
    end,
  })
end
