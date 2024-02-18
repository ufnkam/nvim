local ls = require("null-ls")
local formatting = ls.builtins.formatting
local diagnostics = ls.builtins.diagnostics

ls.setup({
    debug = true,
    sources = {
        diagnostics.flake8.with({extra_args = {"--max-line-length=120"}}),
        formatting.black.with({ extra_args = { "--line_length=120" } }),
        formatting.isort,
        formatting.autoflake.with({extra_args = {"--max-line-length=120"}}),
        formatting.stylua,
        formatting.autopep8.with({extra_args = {"--max-line-length=120"}})
    },
})

vim.keymap.set("n", "<C-L>", vim.lsp.buf.format)
