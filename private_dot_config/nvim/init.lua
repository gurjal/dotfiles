-- vim:foldmethod=marker

-- options {{{
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.cursorline     = false
vim.opt.syntax         = 'enable'
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 0
vim.opt.expandtab      = true
vim.opt.textwidth      = 100
vim.opt.wrap           = false
vim.opt.wrapmargin     = 0
vim.opt.scrolloff      = 4
vim.opt.sidescrolloff  = 8
vim.opt.autoindent     = true
vim.opt.smartindent    = true
vim.opt.ignorecase     = true
vim.opt.smartcase      = true
vim.opt.showmode       = false
-- window
vim.opt.cmdheight      = 0
vim.opt.showtabline    = 1
vim.opt.numberwidth    = 4
vim.opt.laststatus     = 0
vim.opt.signcolumn     = 'yes:1'
vim.opt.title          = true
vim.opt.titleold       = 'st'
vim.opt.splitbelow     = false
vim.opt.splitright     = false
vim.opt.termguicolors  = true
-- backup, undo and swap
vim.opt.undofile       = true
vim.opt.undodir        = vim.fn.stdpath 'cache' .. '/undo'
vim.opt.swapfile       = false
vim.opt.backup         = false
vim.opt.writebackup    = true
-- formatting
-- opt.formatoptions  = 'tcrql'
-- opt.joinspaces     = false
-- util
vim.cmd 'filetype plugin indent on'
vim.opt.shortmess:append 'sI'
vim.opt.timeoutlen  = 500
vim.opt.compatible  = false
vim.opt.clipboard   = 'unnamedplus'
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.wildmode    = { 'list', 'longest' }
vim.opt.hidden      = true
vim.opt.list        = true
vim.opt.lazyredraw  = false
-- }}}
-- keymap {{{
vim.g.mapleader = ' '

-- esc
vim.keymap.set("i", "jk", "<esc>", { silent = true })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "quit" })
vim.keymap.set("n", "<leader>Q", "<cmd>q!<cr>", { desc = "force quit" })
-- file
vim.keymap.set("n", "<leader>y", "<cmd>w<cr><esc>", { desc = "save file" })
vim.keymap.set("n", "<leader><space>", "<cmd>wq<cr><esc>", { desc = "save and quit" })
vim.keymap.set("n", "<leader>fs", "<cmd>w<cr><esc>", { desc = "save file" })
vim.keymap.set("n", "<leader>fq", "<cmd>wq<cr><esc>", { desc = "save and quit" })
-- buffers
vim.keymap.set("n", "\\", "<cmd>bnext<cr>")
vim.keymap.set("n", "|", "<cmd>bprevious<cr>")
vim.keymap.set("n", "<leader>d", "<cmd>bd<cr>", { desc = "kill buffer" })
vim.keymap.set("n", "<leader>k", "<cmd>bd<cr>", { desc = "kill buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "kill buffer" })
vim.keymap.set("n", "<leader>bk", "<cmd>bd<cr>", { desc = "kill buffer" })
-- up/down
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- go to
vim.keymap.set({ "n", "v" }, "gh", "0", { desc = "go to line start" })
vim.keymap.set({ "n", "v" }, "gj", "G", { desc = "go to bottom" })
vim.keymap.set({ "n", "v" }, "gk", "gg", { desc = "go to top" })
vim.keymap.set({ "n", "v" }, "gl", "$", { desc = "go to line end" })
vim.keymap.set({ "n", "v" }, "gm", "%", { desc = "go to matching" })
-- windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "other window" })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "kill window" })
vim.keymap.set("n", "<leader>wk", "<C-W>c", { desc = "kill window" })
vim.keymap.set("n", "<leader>ws", "<C-W>s", { desc = "split window below" })
vim.keymap.set("n", "<leader>wv", "<C-W>v", { desc = "split window right" })
vim.keymap.set("n", "<leader>wo", "<C-W>o", { desc = "current window only" })
-- tabs
vim.keymap.set("n", "<M-h>", "<cmd>tabprevious<cr>")
vim.keymap.set("n", "<M-l>", "<cmd>tabnext<cr>")
vim.keymap.set("n", "<leader><tab>n", "<cmd>tabnew<cr>", { desc = "new tab" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "close tab" })
vim.keymap.set("n", "<leader><tab>k", "<cmd>tabclose<cr>", { desc = "close tab" })
-- search
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")
vim.keymap.set({ "n", "v" }, "gw", "*N")
-- code
vim.keymap.set("n", "<leader>cf", "<cmd>LspZeroFormat<cr><esc>", { desc = "format file" })
-- utility
vim.keymap.set(
    "n",
    "<leader>ur",
    "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
    { desc = "redraw" }
)
vim.keymap.set("n", "<leader>ul", "<cmd>:Lazy<cr>", { desc = "lazy" })
vim.keymap.set("n", "<leader>um", "<cmd>:Mason<cr>", { desc = "mason" })
-- add undo break-points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")
-- visual indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
-- vim.keymap.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "open location list" })
-- vim.keymap.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "open quickfix list" })
-- }}}
-- bootstrap {{{
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    print("Installing 'folke/lazy.nvim'...")
    vim.fn.system({ "git", "clone", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)
-- }}}

require("lazy").setup {

    -- which-key.nvim {{{
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            plugins = { spelling = true },
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            wk.register({
                mode = { "n", "v" },
                ["<leader><tab>"] = { name = "+tabs" },
                ["<leader>b"] = { name = "+buffer" },
                ["<leader>f"] = { name = "+file" },
                ["<leader>g"] = { name = "+git" },
                ["<leader>s"] = { name = "+search" },
                ["<leader>c"] = { name = "+code" },
                ["<leader>u"] = { name = "+utility" },
                ["<leader>w"] = { name = "+windows" },
                ["<leader>x"] = { name = "+diagnostics/quickfix" },
            })
        end,
    },
    -- }}}
    -- telescope.nvim {{{
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = "nvim-lua/plenary.nvim",
        keys = {
            { "<leader>.",  "<cmd>Telescope find_files<cr>",                    desc = "Find Files (root dir)" },
            { "<leader>,",  "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
            { "<leader>/",  "<cmd>Telescope live_grep<cr>",                     desc = "Find in Files (Grep)" },
            { "<leader>:",  "<cmd>Telescope command_history<cr>",               desc = "Command History" },
            -- file
            { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                      desc = "recent files" },
            -- buffer
            { "<leader>bb", "<cmd>Telescope buffers<cr>",                       desc = "search buffers" },
            -- git
            { "<leader>gc", "<cmd>Telescope git_commits<CR>",                   desc = "commits" },
            { "<leader>gs", "<cmd>Telescope git_status<CR>",                    desc = "status" },
            -- search
            { "<leader>sf", "<cmd>Telescope find_files<cr>",                    desc = "files" },
            { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>",     desc = "current buffer" },
            { "<leader>sc", "<cmd>Telescope command_history<cr>",               desc = "command history" },
            { "<leader>sC", "<cmd>Telescope commands<cr>",                      desc = "commands" },
            { "<leader>sd", "<cmd>Telescope diagnostics<cr>",                   desc = "diagnostics" },
            { "<leader>sg", "<cmd>Telescope live_grep<cr>",                     desc = "grep" },
            { "<leader>sh", "<cmd>Telescope help_tags<cr>",                     desc = "help pages" },
            { "<leader>sH", "<cmd>Telescope highlights<cr>",                    desc = "search highlight groups" },
            { "<leader>sk", "<cmd>Telescope keymaps<cr>",                       desc = "key maps" },
            { "<leader>sM", "<cmd>Telescope man_pages<cr>",                     desc = "man pages" },
            { "<leader>sm", "<cmd>Telescope marks<cr>",                         desc = "jump to mark" },
            { "<leader>so", "<cmd>Telescope vim_options<cr>",                   desc = "options" },
            { "<leader>sw", "<cmd>Telescope grep_string<cr>",                   desc = "word" },
            -- utility
            { "<leader>uc", "<cmd>Telescope colorscheme<cr>",                   desc = "switch colorscheme" },
            -- {
            --     "<leader>ss",
            --     Util.telescope("lsp_document_symbols", {
            --         symbols = {
            --             "Class",
            --             "Function",
            --             "Method",
            --             "Constructor",
            --             "Interface",
            --             "Module",
            --             "Struct",
            --             "Trait",
            --             "Field",
            --             "Property",
            --         },
            --     }),
            --     desc = "Goto Symbol",
            -- },
            -- {
            --     "<leader>uC",
            --     Util.telescope("colorscheme", { enable_preview = true }),
            --     desc = "Colorscheme with preview",
            -- },
        },
        opts = {
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                mappings = {
                    n = {
                        ["q"] = function(...)
                            require("telescope.actions").close(...)
                        end,
                    },
                    -- i = {
                    --     ["<c-t>"] = function(...)
                    --         return require("trouble.providers.telescope").open_with_trouble(...)
                    --     end,
                    --     ["<C-i>"] = function()
                    --         Util.telescope("find_files", { no_ignore = true })()
                    --     end,
                    --     ["<C-h>"] = function()
                    --         Util.telescope("find_files", { hidden = true })()
                    --     end,
                    --     ["<C-Down>"] = function(...)
                    --         return require("telescope.actions").cycle_history_next(...)
                    --     end,
                    --     ["<C-Up>"] = function(...)
                    --         return require("telescope.actions").cycle_history_prev(...)
                    --     end,
                    -- },
                },
            },
            pickers = {
                live_grep = { theme = "dropdown" },
                treesitter = { theme = "dropdown" },
                lsp_implementations = { theme = "dropdown" },
                lsp_document_symbols = { theme = "dropdown" },
                lsp_dynamic_workspace_symbols = { theme = "dropdown" },
                lsp_incoming_calls = { theme = "dropdown" },
                lsp_outgoing_calls = { theme = "dropdown" },
                current_buffer_fuzzy_find = { theme = "dropdown" },
                buffers = { initial_mode = "normal", theme = "dropdown" },
            },
        },
    },
    -- }}}
    -- nvim-treesitter {{{
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "c", "lua", "rust" },
                highlight = { enable = true, }
            }
        end
    },
    -- }}}
    -- lsp-zero.nvim {{{
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- lsp support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lua' },
            -- snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
            -- { "lukas-reineke/lsp-format.nvim", config = true },
        },
        config = function()
            local lsp = require('lsp-zero').preset({
                name = 'recommended',
                set_lsp_keymaps = true,
                manage_nvim_cmp = true,
                suggest_lsp_servers = false,
            })
            lsp.nvim_workspace()
            lsp.setup()
            vim.diagnostic.config { virtual_text = true }
        end,
    },
    -- }}}
    -- trouble.nvim {{{
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        opts = { use_diagnostic_signs = true },
        keys = {
            { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics (Trouble)" },
            { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
        },
    },
    -- }}}
    -- neo-tree.nvim {{{
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
            "MunifTanjim/nui.nvim"
        },
        keys = {
            { "<leader>e", "<CMD>Neotree toggle<CR>", mode = { "n" }, desc = 'neotree' }
        },
        opts = {
            filesystem = {
                follow_current_file = true,
            },
        },
    },
    -- }}}
    -- leap.nvim {{{
    {
        "ggandor/leap.nvim",
        event = "VeryLazy",
        name = "leap",
        keys = {
            {
                "s",
                function()
                    require("leap").leap({ target_windows = { vim.fn.win_getid() } })
                end,
                desc = "buffer leap",
            },
        },
        opts = {
            case_sensitive = false,
            highlight_unlabeled_phase_one_targets = false,
        },
    },
    -- }}}
    -- vim-repeat {{{
    { "tpope/vim-repeat", event = "VeryLazy" },
    -- }}}
    -- todo-comments.nvim {{{
    {
        "folke/todo-comments.nvim",
        cmd = { "TodoTrouble", "TodoTelescope" },
        event = "BufReadPost",
        config = true,
        -- stylua: ignore
        keys = {
            { "]t",         function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
            { "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
            { "<leader>xt", "<cmd>TodoTrouble<cr>",                              desc = "Todo (Trouble)" },
            { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",      desc = "Todo/Fix/Fixme (Trouble)" },
            { "<leader>st", "<cmd>TodoTelescope<cr>",                            desc = "Todo" },
        },
    },
    -- }}}
    -- vim-illuminate {{{
    -- {
    --     "RRethy/vim-illuminate",
    --     event = "BufReadPost",
    --     opts = { delay = 200 },
    --     config = function(_, opts)
    --         require("illuminate").configure(opts)
    --     end,
    --     -- stylua: ignore
    --     keys = {
    --         { "]]", function() require("illuminate").goto_next_reference(false) end, desc = "Next Reference", },
    --         { "[[", function() require("illuminate").goto_prev_reference(false) end, desc = "Prev Reference" },
    --     },
    -- },
    -- }}}
    -- gitsigns.nvim {{{
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        opts = {
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "契" },
                topdelete = { text = "契" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
            on_attach = function(buffer)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
                end

                -- stylua: ignore start
                map("n", "]h", gs.next_hunk, "Next Hunk")
                map("n", "[h", gs.prev_hunk, "Prev Hunk")
                map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
                map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
                map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
                map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
                map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
                map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
                map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
                map("n", "<leader>ghd", gs.diffthis, "Diff This")
                map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
            end,
        },
    },
    -- }}}
    -- mini.comment {{{
    { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
    {
        "echasnovski/mini.comment",
        event = "VeryLazy",
        opts = {
            hooks = {
                pre = function()
                    require("ts_context_commentstring.internal").update_commentstring({})
                end,
            },
        },
        config = function(_, opts)
            require("mini.comment").setup(opts)
        end,
    },
    -- }}}
    -- mini.pairs {{{
    {
        "echasnovski/mini.pairs",
        event = "VeryLazy",
        config = function(_, opts)
            require("mini.pairs").setup(opts)
        end,
    },
    -- }}}
    -- mini.surround {{{
    {
        "echasnovski/mini.surround",
        keys = function(plugin, keys)
            -- Populate the keys based on the user's options
            local opts = require("lazy.core.plugin").values(plugin, "opts", false)
            local mappings = {
                { opts.mappings.add,            desc = "Add surrounding",                     mode = { "n", "v" } },
                { opts.mappings.delete,         desc = "Delete surrounding" },
                { opts.mappings.find,           desc = "Find right surrounding" },
                { opts.mappings.find_left,      desc = "Find left surrounding" },
                { opts.mappings.highlight,      desc = "Highlight surrounding" },
                { opts.mappings.replace,        desc = "Replace surrounding" },
                { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
            }
            return vim.list_extend(mappings, keys)
        end,
        opts = {
            mappings = {
                add = "gsa",            -- Add surrounding in Normal and Visual modes
                delete = "gsd",         -- Delete surrounding
                find = "gsf",           -- Find surrounding (to the right)
                find_left = "gsF",      -- Find surrounding (to the left)
                highlight = "gsh",      -- Highlight surrounding
                replace = "gsr",        -- Replace surrounding
                update_n_lines = "gsn", -- Update `n_lines`
            },
        },
        config = function(_, opts)
            -- use gz mappings instead of s to prevent conflict with leap
            require("mini.surround").setup(opts)
        end,
    },
    -- }}}
    -- mini.align {{{
    {
        'echasnovski/mini.align',
        version = '*',
        config = function () end,
    },
    -- }}}
    -- colorschemes {{{
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
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                flavour = "frappe", -- latte, frappe, macchiato, mocha
            })
        end,
    },
    { "bluz71/vim-moonfly-colors" },
    { "bluz71/vim-nightfly-guicolors" },
    { "embark-theme/vim",             name = "embark" },
    { "arcticicestudio/nord-vim" },
    { "junegunn/seoul256.vim" },
    {
        "rose-pine/neovim",
        name = "rose_pine",
        opts = {
            dark_variant = "moon",
            disable_italics = true,
        }
    },
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
    { "ellisonleao/gruvbox.nvim",     name = "gruvbox", opts = { background = "dark" } },
    -- }}}

}

vim.cmd.colorscheme("ayu")
