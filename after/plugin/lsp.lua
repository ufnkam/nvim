local lsp = require("lsp-zero")
local cmp_action = require('lsp-zero').cmp_action()
local cmp = require("cmp")
local lspkind = require('lspkind')

lsp.preset("recommended")

lsp.ensure_installed({
    "rust_analyzer",
	"lua_ls",
	"pyright",
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)


lsp.setup()

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        format = lspkind.cmp_format(
            {
                mode = 'symbol_text',
                maxwidth = 50,
                ellipsis_char = '...',
            }
        )
    }
})
