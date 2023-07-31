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
            ensure_installed = { "lua_ls", "clangd", },
        }

        local function on_attach(client, bufnr)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = 0 })
            vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { buffer = 0 })
            vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { buffer = 0 })
            vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { buffer = 0 })
            vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { buffer = 0 })
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0 })

            local format_on_save = vim.api.nvim_create_augroup('formatOnSave', { clear = false })

            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_create_autocmd({ "BufWritePre" }, {
                    buffer = bufnr,
                    group = format_on_save,
                    callback = function() vim.lsp.buf.format() end,
                    desc = "Format on save a file with formatting capable attached language server"
                })
            end
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
