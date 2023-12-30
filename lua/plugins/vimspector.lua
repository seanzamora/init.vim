-- Vimspector optionsg
vim.g.vimspector_sidebar_width = 85
vim.g.vimspector_bottombar_height = 15
vim.g.vimspector_terminal_maxwidth = 70

-- Vimspector
vim.keymap.set('n', 'db', ':call vimspector#Launch()<cr>')
vim.keymap.set('n', 'dq', ':VimspectorReset<cr>')
vim.keymap.set('n', "dm", ":call vimspector#ToggleBreakpoint()<cr>")
vim.keymap.set('n', "dw", ":call vimspector#Evaluate()<cr>")
vim.keymap.set('n', 'dn', ':call vimspector#Reset()<cr>')
vim.keymap.set('n', 'do', ':call vimspector#StepOver()<cr>')
-- vim.keymap.set('n', 'do', ':call vimspector#StepOut()<cr>')
vim.keymap.set('n', '<di>', ':call vimspector#StepInto()<cr>')
