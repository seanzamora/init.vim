vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    api.events.subscribe(api.events.Event.FileCreated, function(file)
        vim.cmd("edit " .. file.fname)
    end)

    -- custom mappings
    vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
end

local HEIGHT_RATIO = 0.97
local WIDTH_RATIO = 0.5
-- OR setup with some options
require("nvim-tree").setup({
    on_attach = my_on_attach,
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        adaptive_size = true,
        float = {
            enable = true,
            open_win_config = function()
                local screen_w = vim.opt.columns:get()
                local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                local window_w = screen_w * WIDTH_RATIO
                local window_h = screen_h * HEIGHT_RATIO
                local window_w_int = math.floor(window_w)
                local window_h_int = math.floor(window_h)
                local center_x = screen_w
                local center_y = 0
                return {
                    border = 'rounded',
                    relative = 'editor',
                    row = 0,
                    col = screen_w,
                    width = window_w_int,
                    height = window_h_int,
                }
            end,
        },
        width = 40,
        side = "right"
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})
