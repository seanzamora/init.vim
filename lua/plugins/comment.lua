require('Comment').setup()

vim.keymap.set({ "n", "v" }, "<C-_>", ":call feedkeys(\"gcc\")<CR>")
