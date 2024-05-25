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
      command = "cargo",
      name = "Launch file",
      type = "lldb",
      request = "launch",
      program = function()
        return vim.fn.getcwd() .. "/", "/target/debug/constellar-driver-manager"
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},
      runInTerminal = false,
    },
  }
end

M.DebugFileWithConfig = function()
  local _path = path.join(vim.fn.getcwd(), ".nvim", "launch.json")
  dapvs.load_launchjs(_path)
end

return M
