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
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = "codelldb",
          args = { "--port", "${port}" },
        },
      }
    end,

    --vim.highlight.create("DapBreakpoint", { ctermbg = 0, guifg = "#993939", guibg = "#31353f" }, false),
    --vim.fn.sign_define(
    --  "DapBreakpoint",
    --  { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    --),
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
