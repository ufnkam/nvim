local M = {}
local dap = require("dap")
local dapvs = require("dap.ext.vscode")
local path = require("lspconfig.util").path

M.DebugCurrentFilefunction = function()
  dap.configurations.python = {
    {
      name = "Launch file",
      type = "python",
      request = "launch",
      program = "${file}",
    },
  }
end

M.DebugFileWithConfig = function()
  local _path = path.join(vim.fn.getcwd(), ".nvim", "launch.json")
  dapvs.load_launchjs(_path)
end

return M
