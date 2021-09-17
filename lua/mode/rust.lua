return function(opt, cap)
	require("lspconfig").rust_analyzer.setup({
		on_attach = opt,

		capabilities = cap(),
	})
end
