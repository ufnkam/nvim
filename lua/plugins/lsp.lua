local python_env = require("python_env")

return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {
          settings = {
            python = {
              pythonPath = python_env.py_path,
              analysis = {
                extraPaths = "workspace",
                autoSearchPaths = true,
              },
            },
          },
        },
      },
    },
  },
}
