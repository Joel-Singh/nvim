-- Here and not keymaps because needs to be set before lazy
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
  require 'custom.plugins.blink',
  require 'custom.plugins.conform',
  require 'custom.plugins.duck',
  require 'custom.plugins.git-signs',
  require 'custom.plugins.gitsigns',
  require 'custom.plugins.guess-indent',
  require 'custom.plugins.init',
  require 'custom.plugins.lazydev',
  require 'custom.plugins.mini',
  require 'custom.plugins.nvim-lspconfig',
  require 'custom.plugins.oil',
  require 'custom.plugins.telescope-symbols',
  require 'custom.plugins.telescope',
  require 'custom.plugins.tokyo-night',
  -- require 'custom.plugins.treesitter',
  require 'custom.plugins.typst-preview',
  require 'custom.plugins.vim-rooter',
  require 'custom.plugins.vim-sleuth',
  require 'custom.plugins.which-key',
  require 'custom.plugins.autopairs',
  require 'custom.plugins.debug',
  require 'custom.plugins.lint',
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

require 'custom.settings.run_current_file'
require 'custom.settings.keymaps'
require 'custom.settings.options'
require 'custom.settings.autocmds'
require 'custom.settings.inkscape-commands'
require 'custom.settings.lua-snip'
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
