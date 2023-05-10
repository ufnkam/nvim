local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    "rust-analyzer",
	"lua_ls",
	"pyright",
    "sqlls",
    "wgsl-analyzer"
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

local cmp = require("cmp")

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  }
})

lsp.setup()
