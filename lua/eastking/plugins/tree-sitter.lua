local M = {
  'nvim-treesitter/nvim-treesitter',
  build = { ':tsupdate' },
  dependencies = {
    {
      'nvim-treesitter/nvim-treesitter-textobjects'
    }
  }
}

M.opts = {
  highlight = { enable = true },
  indent = { enable = true },
  ensure_installed = {
    'c',
    'lua',
    'vim',
    'vimdoc',
    'query',
  },
  sync_install = false,
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',       -- set to `false` to disable one of the mappings
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<bs>',
    },
  },
  -- options related to nvim-treesitter-textobjects
  textobjects = {
    select = {
      enable = true,
      lookahead = true,

      keymaps = {
        ['aa'] = { query = '@parameter.outer', desc = 'Outer Parameter' },
        ['ia'] = { query = '@parameter.inner', desc = 'Inner Parameter' },
        ['af'] = { query = '@function.outer', desc = 'Outer Function' },
        ['if'] = { query = '@function.inner', desc = 'Inner Function' },
        ['ac'] = { query = '@class.outer', desc = 'Outer Class' },
        ['ic'] = { query = '@class.inner', desc = 'select inner part of a class region' },
        ['il'] = { query = '@loop.inner', desc = 'Inner Loop' },
        ['al'] = { query = '@loop.outer', desc = 'Outer Loop' },
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

function M.config()
  require('nvim-treesitter.configs').setup(M.opts)
end

return M
