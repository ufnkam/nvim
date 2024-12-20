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
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local transparent = require("transparent")
      transparent.setup({
        -- table: default groups
        groups = {
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "NonText",
          "SignColumn",
          "CursorLine",
          "CursorLineNr",
          "StatusLine",
          "StatusLineNC",
          "EndOfBuffer",
        },
        -- table: additional groups that should be cleared
        extra_groups = {},
        -- table: groups you don't want to clear
        exclude_groups = {},
        -- function: code to be executed after highlight groups are cleared
        -- Also the user event "TransparentClear" will be triggered
        on_clear = function() end,
      })
    end,
  },
}
