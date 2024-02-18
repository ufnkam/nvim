local lsp = require("lsp-zero")
local cmp_action = require('lsp-zero').cmp_action()
local cmp = require("cmp")
local lspkind = require('lspkind')
local lspconfig = require('lspconfig')
local python_env = require("python_env")
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
lspconfig.pyright.setup{
    on_attach = on_attach;
    settings = {
        python = 
            {
                pythonPath = python_env.py_path,
                analysis = {
                    extraPaths = "workspace",
                    autoSearchPaths = true,

                }
            }
        };
    root_files = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
        './nvim/pyrightconfig.json',
    };
}
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
