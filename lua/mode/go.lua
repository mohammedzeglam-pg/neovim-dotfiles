return function(opt, cap)
	require("lspconfig").gopls.setup({
		on_attach = opt,
		capabilities = cap(),
	})
end
