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
        disable_netrw = true,
        hijack_netrw = true,
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
            show_on_open_dirs = true,
        },
    }
end

return M
