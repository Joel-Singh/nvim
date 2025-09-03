local function run_current_file()
  vim.cmd 'wa'
  if vim.bo.filetype == 'tex' then
    vim.cmd 'silent !mkdir -p %:h/output/ &'
    vim.cmd 'silent !zathura %:h/output/*.pdf &'
  end

  if vim.bo.filetype == 'python' then
    vim.cmd('cd ' .. vim.fn.expand '%:p:h')
    vim.cmd('!python ' .. vim.fn.expand '%')
  end

  if vim.bo.filetype == 'rust' then
    vim.cmd '15split | term cargo fix --allow-dirty && cargo run'
    vim.cmd 'startinsert'
  end

  if vim.bo.filetype == 'cpp' then
    vim.cmd '15split | term bash -c "cmake --build build && ./build/bin/main"'
    vim.cmd 'startinsert'
  end

  if vim.bo.filetype == 'markdown' then
    vim.cmd 'silent !zathura /tmp/current_md_file_in_nvim.pdf &'
  end

  if vim.bo.filetype == 'typst' then
    vim.cmd 'silent !zathura /tmp/current-typ-file.pdf &'
  end

  if vim.bo.filetype == 'html' then
    vim.cmd 'silent !qutebrowser %'
  end
end

vim.keymap.set('n', '<Leader>cr', run_current_file, { desc = '[C]ode [R]un' })
