return {
    {
        "Shatur/neovim-ayu",
        lazy = true,
        name = "ayu",
        opts = {
            overrides = {
                Normal = { bg = "#0f1419" },
                NormalNC = { bg = "#0f1419" },
                SignColumn = { bg = "#0f1419" },
            },
        },
    },

    {
        "folke/tokyonight.nvim",
        opts = { style = "night" },
    },

    -- catppuccin
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
    },

    { "bluz71/vim-moonfly-colors" },
    { "bluz71/vim-nightfly-guicolors" },
    { "embark-theme/vim", name = "embark" },
    { "arcticicestudio/nord-vim" },
    { "junegunn/seoul256.vim" },
    { "rose-pine/neovim", name = "rose_pine", opts = {
        dark_variant = "moon",
    } },
    {
        "sainnhe/everforest",
        config = function()
            vim.cmd([[
                if has('termguicolors')
                  set termguicolors
                endif
                set background=dark
                let g:everforest_background = 'soft'
                let g:everforest_better_performance = 1
            ]])
        end,
    },
    {
        "sam4llis/nvim-tundra",
        opts = { background = "dark" },
    },
    { "drewtempelmeyer/palenight.vim" },
    { "ellisonleao/gruvbox.nvim", name = "gruvbox", opts = { background = "dark" } },
}
