require('Comment').setup()

vim.keymap.set({ "n" }, "<C-_>", ":call feedkeys(\"gcc\")<CR>")
