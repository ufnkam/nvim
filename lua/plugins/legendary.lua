return {
  {
    "mrjones2014/legendary.nvim",
    priority = 10000,
    lazy = false,
    dependencies = {
      "stevearc/dressing.nvim",
    },
    config = function()
      local legendary = require("legendary")

      local function open_local_settings()
        local path = vim.fn.getcwd() .. "/.nvim/settings.json"
        local dir = vim.fn.getcwd() .. "/.nvim"

        if vim.fn.isdirectory(dir) == 0 then
          vim.fn.mkdir(dir, "p")
        end

        if vim.fn.filereadable(path) == 0 then
          local template = [[{
  "dap": {
    "configurations": []
  }
}]]
          local f = io.open(path, "w")
          if f then
            f:write(template)
            f:close()
          end
        end

        vim.cmd("edit " .. path)
      end

      legendary.setup({
        keymaps = {
          -- Main Mappings
          { "<D-p>", "<cmd>Legendary<cr>", description = "Command Palette (Cmd+p)" },
          { "<C-p>", "<cmd>Legendary<cr>", description = "Command Palette (Ctrl+p)" },
          { "<leader>k", "<cmd>Legendary keymaps<cr>", description = "Search Keymaps" },

          -- File Explorer
          { "<leader>pv", "<cmd>Oil<cr>", description = "Open Oil File Explorer" },

          -- General Actions
          { "<leader>z", vim.cmd.undo, description = "Undo last action" },
          { "<C-b>", "<cmd>bprev<cr>", description = "Previous Buffer" },
          { "<C-s>", "<cmd>write<cr>", description = "Save Current File" },

          -- DAP (From dap.lua but also here for searching)
          { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", description = "Toggle Breakpoint" },
          { "<leader>dc", "<cmd>lua require('dap').continue()<cr>", description = "DAP Continue" },
        },
        commands = {
          {
            ":LocalSettings",
            open_local_settings,
            description = "Find and open settings.json in .nvim catalogue (Local Settings)",
          },
        },
        extensions = {
          lazy_nvim = true,
          which_key = { auto_register = true },
        },
      })
    end,
  },
}
