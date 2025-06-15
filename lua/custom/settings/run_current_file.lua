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
    vim.cmd 'tabnew | term nix-shell /home/apple/repos/nixos/devshells/rust/shell.nix --run "cargo run --features bevy/dynamic_linking"'
    vim.cmd 'startinsert'
  end

  if vim.bo.filetype == 'markdown' then
    vim.cmd 'silent !zathura ~/Personal/Temporary/current_md_file_in_nvim.pdf &'
  end
end

vim.keymap.set('n', '<Leader>cr', run_current_file, { desc = '[C]ode [R]un' })
