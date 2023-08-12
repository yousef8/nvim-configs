local M = {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  }
}

function M.config()
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  -- Make sure termguicolors are enabled. it's already enabled in options.lua
  vim.opt.termguicolors = true

  require('nvim-tree').setup {
  }
end

return M
