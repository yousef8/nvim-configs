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
        local actions = require "telescope.actions"
        local telescope = require('telescope')

        vim.keymap.set('n', '<leader>ff',
            "<cmd> lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown())<CR>",
            {})
        vim.keymap.set('n', '<leader>fg',
            "<cmd> lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown())<CR>",
            {})
        vim.keymap.set('n', '<leader>fb',
            "<cmd> lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown())<CR>",
            {})
        vim.keymap.set('n', '<leader>fh',
            "<cmd> lua require('telescope.builtin').help_tags(require('telescope.themes').get_dropdown())<CR>",
            {})
        vim.keymap.set('n', '<C-_>',
            "<cmd> lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown())<CR>",
            {})

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
