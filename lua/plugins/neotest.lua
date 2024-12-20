return {
  {
    "antoinemadec/FixCursorHold.nvim",
  },
  {
    "rouge8/neotest-rust",
  },
  {
    "nvim-neotest/neotest",
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rust"),
        },
      })
    end,
  },
}
