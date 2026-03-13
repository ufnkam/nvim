return {
  {
    "zbirenbaum/copilot.lua",
    enabled = true,
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true, -- Suggestions appear as you type
        debounce = 75,
        keymap = {
          accept = "<CR>", -- Enter to accept
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<Esc>", -- Esc to decline
        },
      },
      panel = { enabled = false },
    },
  },
  {
    "nvim-cmp",
    enabled = true,
  },
}
