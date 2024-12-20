local M = {}
local dap = require("dap")
local dapvs = require("dap.ext.vscode")
local path = require("lspconfig.util").path

M.DebugCurrentFile = function()
  dap.configurations.python = {
    {
      name = "Launch file",
      type = "python",
      request = "launch",
      program = "${file}",
    },
  }
  dap.configurations.rust = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = "${file}",
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  }
end

M.DebugFileWithConfig = function()
  local _path = path.join(vim.fn.getcwd(), ".nvim", "launch.json")
  print(_path)
  dapvs.load_launchjs(_path)
end

return M
