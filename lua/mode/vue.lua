return function(opt, cap)
	require("lspconfig").vuels.setup({

		capabilities = cap(),
		on_attach = opt,
	})
end
