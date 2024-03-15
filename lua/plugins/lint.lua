return {
  "mfussenegger/nvim-lint",
  events = { "BufNewFile", "BufReadPre" },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      python = { "ruff_fix" },
    }
  end,
}
