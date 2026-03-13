return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      python = function(bufnr)
        if require("conform").get_formatter_info("ruff_format", bufnr).available then
          return { "ruff_format" }
        else
          return { "isort", "black" }
        end
      end,
    },
    rust = { "rustfmt" },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
