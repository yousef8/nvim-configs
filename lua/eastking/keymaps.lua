-- By default 'vim.keymap.set' are set to noremap

-- Set Leader
vim.g.mapleader = ' '

-- Modes
--  normal_mode = 'n'
--  insert_mode = 'i'
--  visual_mode = 'v'
--  visual_block_mode =  'x'
-- term_mode = 't'
-- command_mode = 'c'

-- Better Indentation
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Better Window Navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', {})
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', {})
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', {})
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', {})

-- Explorer Menu
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')

-- Better Movement between buffers
vim.keymap.set('n', '<S-n>', ':bn<CR>')
vim.keymap.set('n', '<S-p>', ':bp<CR>')

-- Press jk to exit insert mode (Experimental)
vim.keymap.set('i', 'jk', '<ESC>')

-- Move text up and down
vim.keymap.set('x', '<A-j>', ":move '>+1<CR>gv-gv")
vim.keymap.set('x', '<A-k>', ":move '<-2<CR>gv-gv")

-- Better paste
vim.keymap.set('v', 'p', '"_dP')
