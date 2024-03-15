local python_env = require("python_env")

return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
      vim.keymap.set("n", "<leader>dr", dap.repl.open)
      vim.keymap.set("n", "<leader>dc", dap.continue)
      dap.adapters.python = {
        type = "executable",
        command = python_env.py_path,
        args = { "-m", "debugpy.adapter" },
      }
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      local ui = require("dapui")
      ui.setup()
      vim.keymap.set("n", "<leader>dr", ui.toggle)
      vim.keymap.set("n", "<leader>drc", ui.close)
    end,
  },
}
