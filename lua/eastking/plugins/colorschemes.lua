return {
	{
        'rose-pine/neovim', 
        name = 'rose-pine', 
        
    },
    {
        "folke/tokyonight.nvim",
        opts = {},
    },
    {
        "shaunsingh/moonlight.nvim",
        lazy = false,
        priority = 1000,
        config= function()
            vim.cmd([[colorscheme moonlight]]) 
        end,

    }
}

