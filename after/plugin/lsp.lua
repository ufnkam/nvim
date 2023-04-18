local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	'sumneko_lua',
	'pyright',
    'sqlls',
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()
