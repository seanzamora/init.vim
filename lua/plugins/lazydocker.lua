local Terminal = require("toggleterm.terminal").Terminal

local open = io.open

local function read_file(path)
    local file = open(path, "rb")  -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

local docker_tui = ' lazydocker'

if file_exists('.lazydocker') then
    local contents = read_file(".lazydocker")
    if contents ~= nil or contents ~= "" then
        docker_tui = contents
    end
end

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


local terminal_client = Terminal:new {
    hidden = true,
    direction = "float",
    float_opts = {
        border = "double",
    },
}

vim.keymap.set({ 'n', 'v' }, '<C-t>', function()
    terminal_client:toggle()
end)
