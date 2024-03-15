return {
  "ThePrimeagen/harpoon",
  config = function(_, opts)
    vim.keymap.set("n", "<leader>a", require("harpoon.mark").add_file)
    vim.keymap.set("n", "<leader>e", require("harpoon.ui").toggle_quick_menu)
  end,
}
