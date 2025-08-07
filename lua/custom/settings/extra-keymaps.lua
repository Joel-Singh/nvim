vim.keymap.set('n', '<Leader>W', '<CMD>w<CR>', { desc = 'Write file' })
vim.keymap.set('n', '<Leader>E', '<CMD>e<CR>', { desc = 'Edit file' })

vim.keymap.set('i', '<C-i>', '<BS>')

vim.keymap.set('i', '{}<CR>', '{<CR>}<Esc>O', { desc = 'Open Braces' })
vim.keymap.set('i', '()<CR>', '(<CR>)<Esc>O', { desc = 'Open Parentheses' })

vim.keymap.set('n', '<A-j>', 'ddp', { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', 'ddkP', { desc = 'Move line up' })

vim.keymap.set('n', '<C-s>', '12<C-w><C-s><Esc>', { desc = 'Create horizontal split' })

vim.keymap.set('n', '<Leader>d', '<CMD>r !cal -3v<CR>o<esc><CMD>r !date <CR>', { desc = 'Create horizontal split' })
