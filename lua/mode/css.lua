return function(opt, cap)
	require("lspconfig").cssls.setup({
		capabilities = cap(),
		on_attach = opt,
	})
end
