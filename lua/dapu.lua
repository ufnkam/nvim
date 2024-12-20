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
      name = "Rust debug",
      type = "codelldb",
      request = "launch",
      program = function()
        vim.fn.jobstart("cargo build")
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = true,
      show_Disassemly = "never",
    },
  }
end

M.DebugFileWithConfig = function()
  local _path = path.join(vim.fn.getcwd(), ".nvim", "launch.json")
  dapvs.load_launchjs(_path)
end

return M
