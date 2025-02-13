return {
  --{
  --  "projekt0n/github-nvim-theme",
  --  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --  priority = 1000, -- make sure to load this before all the other start plugins
  --  config = function()
  --    require("github-theme").setup({
  --      -- ...
  --    })
  --  end,
  --},
  --{
  --  "lunacookies/vim-colors-xcode",
  --  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --  priority = 1000, -- make sure to load this before all the other start plugins
  --},
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-macchiato")
    end,
  },
  "LazyVim/LazyVim",
  opts = {
    colorscheme = "catppuccin-macchiato",
  },
}
