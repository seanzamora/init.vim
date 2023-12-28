require("plugins")

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.keymap.set("n", "<C-z>", ":earlier<CR>")
vim.keymap.set("v", "<C-z>", ":earlier<CR>")

-- vim: ts=2 sts=2 sw=2 et
