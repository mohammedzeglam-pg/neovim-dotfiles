-- return function(opt)
--   require'lspconfig'.tsserver.setup{
--     on_attach=opt
--   }
-- end

-- local function organize_imports()
-- 	local params = {
-- 		command = "_typescript.organizeImports",
-- 		arguments = { vim.api.nvim_buf_get_name(0) },
-- 		title = "",
-- 	}
-- 	vim.lsp.buf.execute_command(params)
-- end
return function(opt, cap)
	require("lspconfig").tsserver.setup({

		capabilities = cap(),
		on_attach = function(client, bufnr)
			opt(client, bufnr)

			local ts_utils = require("nvim-lsp-ts-utils")
			-- defaults
			ts_utils.setup({
				debug = false,
				disable_commands = false,
				enable_import_on_completion = true,

				-- import all
				import_all_timeout = 5000, -- ms
				import_all_priorities = {
					buffers = 4, -- loaded buffer names
					buffer_content = 3, -- loaded buffer content
					local_files = 2, -- git files or files with relative path markers
					same_file = 1, -- add to existing import statement
				},
				import_all_scan_buffers = 100,
				import_all_select_source = true,

				-- eslint
				eslint_enable_code_actions = true,
				eslint_enable_disable_comments = true,
				eslint_bin = "eslint_d",
				eslint_config_fallback = nil,
				eslint_enable_diagnostics = true,
				eslint_show_rule_id = true,

				-- formatting
				enable_formatting = true,
				formatter = "prettierd",

				-- update imports on file move
				update_imports_on_move = true,
				require_confirmation_on_move = false,
				watch_dir = nil,
			})

			-- required to fix code action ranges
			ts_utils.setup_client(client)

			-- no default maps, so you may want to define some here
			local opts = { silent = true }
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", opts)
			-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
		end,
		-- commands = {
		-- 	OrganizeImports = {
		-- 		organize_imports,
		-- 		description = "Organize Imports",
		-- 	},
		-- },
	})
end
