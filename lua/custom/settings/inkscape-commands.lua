local function open_inkscape_diagram()
  local file = vim.fn.expand '<cfile>'

  local buffer_dir = vim.fn.expand '%:h'

  local diagram_file = buffer_dir .. '/' .. file

  if vim.fn.filereadable(diagram_file) ~= 0 then
    vim.fn.system('inkscape' .. ' ' .. diagram_file .. ' &')
  else
    local diagram_dir = vim.fn.fnamemodify(diagram_file, ':h')
    vim.fn.system('mkdir -p ' .. diagram_dir)

    vim.fn.system('cp /home/apple/repos/nixos/config/xdg-config/nvim/assets/empty-svg-template.svg' .. ' ' .. diagram_file)

    vim.fn.system('ln --symbolic' .. ' ' .. diagram_file .. ' ' .. '/home/apple/repos/inkscape-templates/' .. file)
    vim.fn.system('inkscape' .. ' ' .. diagram_file .. ' &')
  end
end

vim.keymap.set('n', '<Leader>i', open_inkscape_diagram, { desc = 'Open Inkscape Diagram' })
