local ls = require("null-ls")
local formatting = ls.builtins.formatting
local diagnostics = ls.builtins.diagnostics

ls.setup({
    debug = true,
    sources = {
        diagnostics.mypy,
        diagnostics.pylint,
        formatting.black.with({ extra_args = { "--fast", "--line_length=120" } }),
        formatting.isort,
        formatting.stylua,
    },
})
