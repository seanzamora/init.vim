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

-- If this is a script, make it executable, and execute it in a split pane on the right
-- Had to include quotes around "%" because there are some apple dirs that contain spaces, like iCloud
vim.keymap.set("n", "<leader>f.", function()
    local file = vim.fn.expand("%")                   -- Get the current file name
    local first_line = vim.fn.getline(1)              -- Get the first line of the file
    if string.match(first_line, "^#!/") then          -- If first line contains shebang
        local escaped_file = vim.fn.shellescape(file) -- Properly escape the file name for shell commands
        vim.cmd("!chmod +x " .. escaped_file)         -- Make the file executable
        vim.cmd("vsplit")                             -- Split the window vertically
        vim.cmd("terminal " .. escaped_file)          -- Open terminal and execute the file
        vim.cmd("startinsert")                        -- Enter insert mode, recommended by echasnovski on Reddit
    else
        vim.cmd("echo 'Not a script. Shebang line not found.'")
    end
end, { desc = "Execute current file in terminal (if it's a script)" })
