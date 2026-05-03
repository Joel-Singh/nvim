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

vim.keymap.set('n', '<Leader>d', 'i<C-r>=system("date | tr -d \'\\n\'")<CR><Esc>', { desc = 'Read Todays [d]ate' })
vim.keymap.set(
  'n',
  '<Leader>D',
  "i<C-r>=system(\"date '+datetime\\(year: \\%Y, month: \\%m, day: \\%e\\)' | tr -d '\\n'\")<CR><Esc>",
  { desc = 'Read Todays [D]ate as Typst' }
)

vim.keymap.set('n', '<C-n>', '<CMD>cnext<CR>', { desc = 'Quickfix Next' })
vim.keymap.set('n', '<C-p>', '<CMD>cprev<CR>', { desc = 'Quickfix Previous' })

vim.keymap.set('n', '<Leader>O', '<CMD>Oil<CR>', { desc = '[O]il' })

-- This... was vibecoded. No idea how it works.
local get_current_time_command = [[gdbus call --session --dest org.mpris.MediaPlayer2.vlc --object-path /org/mpris/MediaPlayer2 \
   --method org.freedesktop.DBus.Properties.Get org.mpris.MediaPlayer2.Player Position \
 | grep -oE '[0-9]+' | tail -n1 \
  | awk '{us=$1; ms=int(us/1000); s=int(ms/1000); ms%=1000; m=int(s/60); s%=60; printf "%02d:%02d.%03d\n", m,s,ms}']]

local function insert_current_time()
  local output = vim.fn.systemlist(get_current_time_command)
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_err_writeln('get_current_time failed: ' .. table.concat(output, '\n'))
    return
  end

  local text = output[1] and vim.trim(output[1]) or ''
  if text == '' then
    vim.api.nvim_err_writeln 'get_current_time returned empty output'
    return
  end

  vim.api.nvim_put({ text }, 'c', true, true)
end

vim.keymap.set('n', '<Leader>t', insert_current_time, { desc = 'Insert current time' })

vim.keymap.set('x', '<Leader>cw', '<Plug>(coerce-visual)', { desc = 'Coerce visual' })
vim.keymap.set('n', ',', '@@', { desc = 'Repeat Macro' })
