return function(opt,cap)
	require("lspconfig").angularls.setup({
    on_attach = opt,
    capabilities = cap()
	})
end
