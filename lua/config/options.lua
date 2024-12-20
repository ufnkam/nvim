vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.api.nvim_set_option("clipboard", "unnamedplus")

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "number"

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>z", vim.cmd.undo)
vim.keymap.set("n", "<C-b>", vim.cmd.bprev)
vim.keymap.set("n", "<C-s>", vim.cmd.write)
vim.opt.showtabline = 0
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
