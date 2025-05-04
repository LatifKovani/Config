require 'core.options'
require 'core.keymaps'
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local out = vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- bootstrap lazy.nvim, LazyVim and your plugins
require('lazy').setup {
  require 'plugins.colortheme',
  require 'plugins.neotree',
  require 'plugins.bufferline',
  require 'plugins.lualine',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  require 'plugins.gitsigns',
  require 'plugins.aplha',
  require 'plugins.closetag',
  require 'plugins.completions',
  require 'plugins.none-ls',
  require 'plugins.closepairs',
  require 'plugins.linting',
  require 'plugins.formatting',
}
