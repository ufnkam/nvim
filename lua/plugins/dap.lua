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
          command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }

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
            vim.notify("Building...", vim.log.levels.INFO)
            local lines = vim.fn.systemlist("cargo build --message-format=json")
            if vim.v.shell_error ~= 0 then
              vim.notify("Cargo build failed", vim.log.levels.ERROR)
            end
            local executable = nil
            for _, line in ipairs(lines) do
              local ok, data = pcall(vim.json.decode, line)
              if ok and data and data.reason == "compiler-artifact" and data.executable ~= nil and data.executable ~= vim.NIL then
                for _, kind in ipairs(data.target.kind) do
                  if kind == "bin" then
                    executable = data.executable
                    break
                  end
                end
              end
            end
            if executable then
              return executable
            end
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          showDisassembly = "never",
        },
      }

      vim.fn.sign_define("DapBreakpoint", { text = "•", texthl = "red", linehl = "", numhl = "" })
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
