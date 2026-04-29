-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd(
  { 'BufWritePost' },
  { pattern = { '*.tex' }, command = 'silent !mkdir -p %:h/output && pdflatex -output-directory=%:h' .. '/output' .. ' % > /dev/null &' }
)

vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*.md',
  command = 'update | doautocmd BufWritePre | doautocmd BufWritePost',
})

vim.api.nvim_create_autocmd('FocusLost', {
  pattern = '*',
  command = 'silent! update',
})

vim.api.nvim_create_autocmd('FocusGained', {
  pattern = '*',
  command = 'silent! sleep 50m | checktime',
})

-- vim.api.nvim_create_autocmd('SwapExists', {
--   callback = function()
--     vim.v.swapchoice = 'e' -- 'e' for Edit anyway, 'o' for Read-only
--   end,
-- })

-- Add two spaces to the end of every line
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   pattern = '*.md',
--   callback = function()
--     local save_cursor = vim.fn.getpos '.'
--     vim.cmd [[silent! %s/\([^\ ]\)$/\1  ]]
--     vim.fn.setpos('.', save_cursor)
--   end,
-- })

local remove_double_spaces = false
if remove_double_spaces then
  vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*.md',
    callback = function()
      local save_cursor = vim.fn.getpos '.'
      vim.cmd [[silent! %s/\(\S\)  \(\S\)/\1 \2/g]]
      vim.fn.setpos('.', save_cursor)
    end,
  })
end

vim.api.nvim_create_autocmd({ 'BufWritePost' }, { pattern = { '*.md' }, command = 'silent !pandoc % -o /tmp/current_md_file_in_nvim.pdf &' })

-- vim.api.nvim_create_autocmd({ 'BufWritePost' }, { pattern = { '*.typ' }, command = 'silent !typst compile % /tmp/current-typ-file.pdf &' })

vim.api.nvim_create_autocmd({ 'VimLeavePre' }, { command = 'mksession! ~/.cache/nvim/session.vim' })

-- Restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.cmd 'normal! g`"zz'
    end
  end,
})
