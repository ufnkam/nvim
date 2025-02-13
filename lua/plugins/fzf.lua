return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  config = function(_, opts)
    local fzf = require("fzf-lua")
    vim.keymap.set("n", "<leader>pf", fzf.files)
    vim.keymap.set("n", "<leader>gc", fzf.git_commits)
    vim.keymap.set("n", "<leader>gb", fzf.git_branches)
    vim.keymap.set("n", "<leader>gbb", fzf.git_blame)
    vim.keymap.set("n", "<leader>pg", fzf.live_grep)
    vim.keymap.set("n", "<leader>dss", fzf.dap_breakpoints)
    vim.keymap.set("n", "<leader>dcc", fzf.dap_configurations)
  end,
}
