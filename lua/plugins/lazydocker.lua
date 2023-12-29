local Terminal = require("toggleterm.terminal").Terminal

-- Docker
local docker_tui = "lazydocker"

local docker_client = Terminal:new {
    cmd = docker_tui,
    dir = "git_dir",
    hidden = true,
    direction = "float",
    float_opts = {
        border = "double",
    },
}

vim.keymap.set({ 'n', 'v' }, '<C-c>', function()
    docker_client:toggle()
end)
