return {
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        char = {
          jump_labels = true,
        },
      },
    },
    keys = {
      { "S", mode = { "n", "x", "o" }, false }, -- Disable default Flash S mapping
    },
  },
  {
    "nvim-mini/mini.surround",
    opts = {
      mappings = {
        add = "sa", -- Add surrounding in Normal and Visual modes
        delete = "sd", -- Delete surrounding
        find = "sf", -- Find surrounding (to the right)
        find_left = "sF", -- Find surrounding (to the left)
        highlight = "sh", -- Highlight surrounding
        replace = "sr", -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`
      },
    },
    keys = {
      { "S", [[:<C-u>lua MiniSurround.add("visual")<CR>]], mode = "x", desc = "Surround visual selection" },
      { "sa", desc = "Add surrounding", mode = { "n", "x" } },
      { "sd", desc = "Delete surrounding" },
      { "sr", desc = "Replace surrounding" },
      { "sf", desc = "Find surrounding (right)" },
      { "sF", desc = "Find surrounding (left)" },
      { "sh", desc = "Highlight surrounding" },
      { "sn", desc = "Update n_lines" },
    },
  },
}
