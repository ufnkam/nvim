return {
  "echasnovski/mini.surround",
  version = "*",
  config = function()
    local minisr = require("mini.surround")
    minisr.setup({
      mappings = {
        add = "gsa",
        delete = "gsd",
        replace = "gsr",
      },
    })
  end,
}
