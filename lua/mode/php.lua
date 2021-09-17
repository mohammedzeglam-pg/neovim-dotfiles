return function(opt, cap)
	require("lspconfig").phpactor.setup({
		on_attach = opt,

		capabilities = cap(),
	})
end
