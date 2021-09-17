return function(opt,cap)

  require "lspconfig".html.setup {

    capabilities = cap(),
    on_attach = opt
  }
end
