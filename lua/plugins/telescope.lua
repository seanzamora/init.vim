local status, telescope = pcall(require, "telescope")

if (not status) then return end

local actions = require('telescope.actions')
local builtin = require("telescope.builtin")
local trouble = require("trouble.providers.telescope")
local t = require("trouble")

telescope.setup {
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close,
                [";;"] = trouble.open_with_trouble
            },
            i = { [";;"] = trouble.open_with_trouble },
        },
        file_ignore_patterns = { "node_modules", ".git", "package.*.json", ".vscode", ".editorconfig", ".cargo", "target" }
    },
    extensions = {},
}

require("telescope").load_extension "file_browser"
-- keymaps
vim.keymap.set('n', '\\\\', function() builtin.find_files({ no_ignore = false, hidden = true }) end)
vim.keymap.set('n', ';g', function() builtin.buffers() end)
vim.keymap.set('n', ';t', function() builtin.live_grep({ no_ignore = false }) end)
vim.keymap.set('i', ';r', function() trouble.open_with_trouble() end)
vim.keymap.set('n', ';r', function() t.toggle() end)
vim.keymap.set('n', ';q', function() t.toggle('quickfix') end)
vim.keymap.set('n', ';p', function() t.toggle('lsp_references') end)

-- vim.keymap.set('n', '<C-n>', ':Telescope file_browser<CR>', { noremap = true, silent = true })
vim.keymap.set(
    "n",
    "<C-n>",
    ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
    { noremap = true }
)

-- vim.keymap.set('n', 'C-n', function() builtin.help_tags() end)
vim.keymap.set('n', ';;', function() builtin.resume() end)
vim.keymap.set('n', ';e', function() builtin.diagnostics() end)
