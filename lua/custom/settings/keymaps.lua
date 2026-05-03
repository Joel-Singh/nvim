vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<C-space>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<Leader>T', '<cmd>tabnew<CR><cmd>terminal<CR>ilazygit && e<CR>', { desc = 'Enter Lazygit With Terminal' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-c>', '<C-w><C-c>', { desc = 'Close window' })

vim.keymap.set('n', '<Leader>W', '<CMD>w<CR>', { desc = 'Write file' })
vim.keymap.set('n', '<Leader>E', '<CMD>e<CR>', { desc = 'Edit file' })

vim.keymap.set('i', '<C-i>', '<BS>')

vim.keymap.set('i', '{}<CR>', '{<CR>}<Esc>O', { desc = 'Open Braces' })
vim.keymap.set('i', '()<CR>', '(<CR>)<Esc>O', { desc = 'Open Parentheses' })

vim.keymap.set('n', '<A-j>', ':m +1<CR>', { desc = 'Move selected lines down' })
vim.keymap.set('n', '<A-k>', ':m -2<CR>', { desc = 'Move selected lines up' })

vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })

vim.keymap.set('n', '<C-s>', '12<C-w><C-s><Esc>', { desc = 'Create horizontal split' })

vim.keymap.set('n', '<Leader>d', "i<C-r>=systemlist('date')[0]<CR><Esc>", { desc = 'Read Todays [D]ate' })

vim.keymap.set('n', '<C-n>', '<CMD>cnext<CR>', { desc = 'Quickfix Next' })
vim.keymap.set('n', '<C-p>', '<CMD>cprev<CR>', { desc = 'Quickfix Previous' })

vim.keymap.set('n', '<Leader>O', '<CMD>Oil<CR>', { desc = '[O]il' })
