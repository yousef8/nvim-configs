return {
	{
        'rose-pine/neovim', 
        name = 'rose-pine', 
        lazy = true,
        
    },
    {
        "folke/tokyonight.nvim",
        lazy = true,
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

