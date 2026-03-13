return {
  "mfussenegger/nvim-lint",
  events = { "BufWritePost", "BufReadPost", "InsertLeave" },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      python = { "ruff" },
    }
  end,
}
