local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<C-m>", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
