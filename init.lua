require("plugins")
require("snippets")

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.nu = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.wo.relativenumber = true

vim.keymap.set("n", "<C-z>", ":earlier<CR>")
vim.keymap.set("v", "<C-z>", ":earlier<CR>")

--Keep Cursor in Middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--Shift Move Block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set({ "n", "v" }, "<F9>", ":!%:p<CR>")
<<<<<<< HEAD
vim.opt_local.dictionary:append('/home/seanzamorea/.local/share/nvim/site/pack/packer/start/wowlua.vim/dict/wowlua.dict')
=======
-- vim.api.nvim_set_hl(0, 'Normal', { ctermbg = 0, ctermfg = 0 })
-- vim.api.nvim_set_hl(0, 'NonText', { ctermbg = 0, ctermfg = 0 })
>>>>>>> d405522 (Updated)
