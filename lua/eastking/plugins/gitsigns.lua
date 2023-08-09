local M = {
    "lewis6991/gitsigns.nvim",
    opts = {
        signs = {
            add          = { text = '│' },
            change       = { text = '│' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        on_attach = function(bufnr)
            vim.keymap.set('n', '<leader>hk', require('gitsigns').prev_hunk, { buffer = bufnr, desc = '[H]unk previous' })
            vim.keymap.set('n', '<leader>hj', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[H]unk next' })
            vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk,
                { buffer = bufnr, desc = '[H]unk preview' })
        end
    },
}


return M
