-- Vimspector optionsg
vim.g.vimspector_sidebar_width = 85
vim.g.vimspector_bottombar_height = 15
vim.g.vimspector_terminal_maxwidth = 70

-- Vimspector
vim.keymap.set('n', '<C-q>', ':call vimspector#Launch()<cr>')
vim.keymap.set('n', '<C-5>', ':call vimspector#StepOver()<cr>')
vim.keymap.set('n', '<C-8>', ':call vimspector#Reset()<cr>')
vim.keymap.set('n', '<C-7>', ':call vimspector#StepOver()<cr>')
vim.keymap.set('n', '<C-6>', ':call vimspector#StepOut()<cr>')
vim.keymap.set('n', '<C-0>', ':call vimspector#StepInto()<cr>')

vim.keymap.set('n', "C-b", ":call vimspector#ToggleBreakpoint()<cr>")
-- vim.keymap.set('n', "Dw", ":call vimspector#AddWatch()<cr>")
-- vim.keymap.set('n', "De", ":call vimspector#Evaluate()<cr>")
