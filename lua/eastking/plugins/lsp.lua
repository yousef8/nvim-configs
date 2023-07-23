return
{
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "williamboman/mason.nvim",
        },
        {
            "https://github.com/williamboman/mason-lspconfig.nvim",
        },
    },
    config = function()
        require("mason").setup()

        require("mason-lspconfig").setup {
            ensure_installed = { "lua_ls", "clangd" },
        }

        local function on_attach()
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = 0 })
            vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { buffer = 0 })
            vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { buffer = 0 })
            vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { buffer = 0 })
            vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { buffer = 0 })
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0 })
        end

        require("mason-lspconfig").setup_handlers {
            function(server_name)
                local capabilities = require('cmp_nvim_lsp').default_capabilities()

                require("lspconfig")[server_name].setup {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            end,
        }
    end,
}
