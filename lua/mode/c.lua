return function(opt, cap)
	-- require'lspconfig'.ccls.setup{
	--   on_attach = opt
	-- }
	--
	require("lspconfig").clangd.setup({
		capabilities = cap(),
		on_attach = opt,
	})
end
