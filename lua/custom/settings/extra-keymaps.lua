vim.keymap.set('n', '<Leader>W', '<CMD>w<CR>', { desc = 'Write file' })
vim.keymap.set('n', '<Leader>E', '<CMD>e<CR>', { desc = 'Edit file' })

vim.keymap.set('n', '<Leader>cc', '<CMD>CodeCompanionChat<CR>', { desc = '[C]ode [C]hat' })

vim.keymap.set('n', '<A-n>', '<CMD>tabnew<CR>', { desc = 'Tab new' })
vim.keymap.set('n', '<A-l>', '<CMD>tabnext<CR>', { desc = 'Tab Next' })
vim.keymap.set('n', '<A-h>', '<CMD>tabprevious<CR>', { desc = 'Tab Previous' })
vim.keymap.set('n', '<A-c>', '<CMD>tabclose<CR>', { desc = 'Tab Close' })

vim.keymap.set('i', '<C-i>', '<BS>')

vim.keymap.set('i', '{}<CR>', '{<CR>}<Esc>O', { desc = 'Open Braces' })
vim.keymap.set('i', '()<CR>', '(<CR>)<Esc>O', { desc = 'Open Parentheses' })
