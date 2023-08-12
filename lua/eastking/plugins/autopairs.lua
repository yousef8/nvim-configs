local M = {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
}

function M.config()
  local npairs = require 'nvim-autopairs'
  local Rule   = require 'nvim-autopairs.rule'

  npairs.setup {
    -- Treesitter support
    check_ts = true,
    ts_config = {
      lua = { 'string' },       -- it will not add a pair on that treesitter node
      javascript = { 'template_string' },
      java = false,             -- don't check treesitter on java
    },
    enable_check_bracket_line = false,
    fast_wrap = {},
  }

  -- Add space between parentheses when hitting <CR>
  local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
  npairs.add_rules {
    Rule(' ', ' ')
        :with_pair(function(opts)
          local pair = opts.line:sub(opts.col - 1, opts.col)
          return vim.tbl_contains({
            brackets[1][1] .. brackets[1][2],
            brackets[2][1] .. brackets[2][2],
            brackets[3][1] .. brackets[3][2],
          }, pair)
        end)
  }
  for _, bracket in pairs(brackets) do
    npairs.add_rules {
      Rule(bracket[1] .. ' ', ' ' .. bracket[2])
          :with_pair(function() return false end)
          :with_move(function(opts)
            return opts.prev_char:match('.%' .. bracket[2]) ~= nil
          end)
          :use_key(bracket[2])
    }
  end

  -- Configure autocompletions
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local cmp_status_ok, cmp = pcall(require, 'cmp')
  if not cmp_status_ok then
    return
  end
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

return M
