return
{
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies =
    {
        {
            "nvim-lua/plenary.nvim",
        },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build =
            'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
        },
        {
            "nvim-tree/nvim-web-devicons",
        },
    },

    config = function(_, _)
        local builtin = require('telescope.builtin')
        local telescope = require "telescope"
        local actions = require "telescope.actions"
        local themes = require "telescope.themes"

        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<C-_>', builtin.current_buffer_fuzzy_find, {})


        telescope.setup {
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                path_display = { "smart" },
                file_ignore_patterns = { ".git/", "node_modules" },
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    }
                }
            },
        }


        telescope.load_extension('fzf')
    end,
}
