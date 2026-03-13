return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended for stable releases
    lazy = false, -- This plugin is already lazy
    config = function()
      vim.g.rustaceanvim = {
        server = {
          settings = {
            ["rust-analyzer"] = {
              check = {
                command = "clippy",
              },
            },
          },
        },
      }
    end,
  },
  {
    "antoinemadec/FixCursorHold.nvim",
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
    },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      vim.list_extend(opts.adapters, {
        require("rustaceanvim.neotest"),
      })
    end,
    config = function(_, opts)
      require("neotest").setup(opts)
    end,
  },
}
