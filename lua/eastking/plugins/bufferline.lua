local M = {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons'
}

function M.config()
  vim.opt.termguicolors = true

  local bufferline = require 'bufferline'
  bufferline.setup {
    options = {
      indicator = {
        style = 'underline',
      },
      diagnostics = 'nvim_lsp',
      offsets = {
        {
          filetype = 'NvimTree',
          text = 'File Explorer',
          text_align = 'center',
          separator = true
        }
      },
      separator_style = 'slope',
    },
  }
end

return M
