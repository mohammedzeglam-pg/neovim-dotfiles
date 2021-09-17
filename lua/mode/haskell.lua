return function(opt,cap)
	require("lspconfig").ghcide.setup({
		on_attach = opt,
    capabilities = cap()
	})
end
