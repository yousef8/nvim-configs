local M = {
  'echasnovski/mini.bufremove',
  version = '*',
  config = true,
}

function M.config()
  local Bufremove = require('mini.bufremove')

  vim.keymap.set('n', '<leader>bd', Bufremove.delete, { desc = '[B]uffer [D]elete' })
  Bufremove.setup {}
end

return M
