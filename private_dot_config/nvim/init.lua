-- vim:foldmethod=marker

-- TODO: find zsh formatter or a way to use bash formatter for zsh files

-- load lua modules {{{
vim.loader.enable()
-- }}}
-- options {{{
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.cursorline     = true
vim.opt.syntax         = 'enable'
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 0
vim.opt.expandtab      = true
vim.opt.textwidth      = 100
vim.opt.wrap           = false
vim.opt.linebreak      = true
vim.opt.wrapmargin     = 0
vim.opt.scrolloff      = 4
vim.opt.sidescrolloff  = 4
vim.opt.autoindent     = true
vim.opt.smartindent    = true
vim.opt.ignorecase     = true
vim.opt.smartcase      = true
vim.opt.showmode       = false
-- window {{{
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
-- }}}
-- backup, undo and swap {{{
vim.opt.undofile       = true
vim.opt.undodir        = vim.fn.stdpath 'cache' .. '/undo'
vim.opt.swapfile       = false
vim.opt.backup         = false
vim.opt.writebackup    = true
-- }}}
-- formatting {{{
vim.opt.formatoptions  = 'jtcroql' -- see 'fo-table'
vim.opt.joinspaces     = false
-- }}}
-- util {{{
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
-- }}}
-- keybinds {{{
vim.g.mapleader = ' '
vim.keymap.set("i", "jk", "<esc>", { silent = true })
vim.keymap.set("i", "kj", "<esc>", { silent = true })
vim.keymap.set("n", "<leader>q", ":q<cr>", { desc = "quit" })
vim.keymap.set("n", "<leader>Q", ":q!<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>y", ":w<cr><esc>", { desc = "write" })
vim.keymap.set("n", "<leader><leader>", ":wq<cr>")
-- TODO: quick search {{{
-- feature where i press space twice to start search and space once to confirm search
-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.api.nvim_create_augroup("QuickSearchConfirm", { clear = true })
--     vim.api.autocmd("CmdlineEnter", {
--         group = "QuickSearchConfirm",
--         callback = function()
--             vim.keymap.set("i", "<space>", "<cr>")
--         end,
--     })
--     vim.api.autocmd("CmdlineLeave", {
--         group = "QuickSearchConfirm",
--         callback = function()
--             vim.keymap.set("i", "<space>", "<space>")
--         end,
--     })
--     vim.api.nvim_feedkeys("/", "n", true);
-- end, { desc = "quick search" })
-- }}}
-- go to {{{
-- cursor go to screen
vim.keymap.set({ "n", "v" }, "gh", "H",  { desc = "cursor to top" })
vim.keymap.set({ "n", "v" }, "gm", "M",  { desc = "cursor to middle" })
vim.keymap.set({ "n", "v" }, "gl", "L",  { desc = "cursor to bottom" })
-- screen go to cursor
vim.keymap.set({ "n", "v" }, "gk",  "zt", { desc = "top to cursor" })
vim.keymap.set({ "n", "v" }, "g.",  "zz", { desc = "middle to cursor" })
vim.keymap.set({ "n", "v" }, "gj",  "zb", { desc = "bottom to cursor" })
-- }}}
-- buffers {{{
vim.keymap.set("n", "\\", ":bnext<cr>")
vim.keymap.set("n", "|", ":bprevious<cr>")
vim.keymap.set("n", "<leader>k", ":bd<cr>", { desc = "kill buffer" })
--
-- NOTE: not using buffer menu for now -> see telescope config
-- vim.keymap.set("n", "<leader>bk", ":bd<cr>", { desc = "kill buffer" })
-- }}}
-- windows {{{
vim.keymap.set("n", "<leader>,", "<C-W>w", { desc = "next window" })
vim.keymap.set("n", "<leader><", "<C-W>p", { desc = "prev window" })
vim.keymap.set("n", "<leader>d", "<C-W>c", { desc = "delete window frame" })
vim.keymap.set("n", "<leader>ww", "<C-W>w", { desc = "next window" })
vim.keymap.set(
    "n",
    "<leader>wo",
    ":resize 32<cr>:vertical resize 120<cr>",
    { desc = "zoom current window" }
)
vim.keymap.set("n", "<leader>wO", "<C-w>=", { desc = "reset current window" })
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "focus left window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "focus down window" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "focus up window" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "focus right window" })
vim.keymap.set("n", "<leader>wH", "<C-w>H", { desc = "move window left" })
vim.keymap.set("n", "<leader>wJ", "<C-w>J", { desc = "move window down" })
vim.keymap.set("n", "<leader>wK", "<C-w>K", { desc = "move window up" })
vim.keymap.set("n", "<leader>wL", "<C-w>L", { desc = "move window right" })
vim.keymap.set("n", "<leader>wm", "<C-W>o", { desc = "maximise current window" })
vim.keymap.set("n", "<leader>w-h", "<C-w>-", { desc = "decrease window height" })
vim.keymap.set("n", "<leader>w-w", "<C-w><", { desc = "decrease window width" })
vim.keymap.set("n", "<leader>w+h", "<C-w>+", { desc = "increase window height" })
vim.keymap.set("n", "<leader>w+w", "<C-w>>", { desc = "increase window width" })
vim.keymap.set("n", "<leader>wr", "<C-w>r", { desc = "rotate windows forward" })
vim.keymap.set("n", "<leader>wR", "<C-w>R", { desc = "rotate windows backward" })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "delete window" })
vim.keymap.set("n", "<leader>ws", "<C-W>s", { desc = "split window below" })
vim.keymap.set("n", "<leader>wv", "<C-W>v", { desc = "split window right" })
-- }}}
-- tabs {{{
vim.keymap.set("n", "<leader><tab>0", ":tabnew<cr>", { desc = "new tab" })
vim.keymap.set("n", "<leader><tab>1", ":tabnew<cr>", { desc = "new tab" })
vim.keymap.set("n", "<leader><tab>2", ":tabnew<cr>", { desc = "new tab" })
vim.keymap.set("n", "<leader><tab>3", ":tabnew<cr>", { desc = "new tab" })
vim.keymap.set("n", "<leader><tab>4", ":tabnew<cr>", { desc = "new tab" })
vim.keymap.set("n", "<leader><tab>5", ":tabnew<cr>", { desc = "new tab" })
vim.keymap.set("n", "<leader><tab>6", ":tabnew<cr>", { desc = "new tab" })
vim.keymap.set("n", "<leader><tab>7", ":tabnew<cr>", { desc = "new tab" })
vim.keymap.set("n", "<leader><tab>8", ":tabnew<cr>", { desc = "new tab" })
vim.keymap.set("n", "<leader><tab>9", ":tabnew<cr>", { desc = "new tab" })

vim.keymap.set("n", "<leader><tab>n", ":tabnew<cr>", { desc = "new tab" })
vim.keymap.set("n", "<leader><tab>d", ":tabclose<cr>", { desc = "close tab" })
-- }}}
-- lsp {{{
vim.keymap.set({ "n", "v" }, "<leader>cf", function() vim.lsp.buf.format() end, { desc = "format file" })
vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.rename() end, { desc = "rename symbol" })
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { desc = "code action" })
vim.keymap.set("n", "<leader>ch", function() vim.lsp.buf.signature_help() end, { desc = "signature help" })
vim.keymap.set("n", "<leader>ci", ":LspInfo<cr>", { desc = "lsp info" })
vim.keymap.set("n", "<leader>cl", ":LspStop<cr>", { desc = "stop lsp" })
vim.keymap.set("n", "<leader>cL", ":LspStart<cr>", { desc = "start lsp" })
-- }}}
-- file {{{
-- vim.keymap.set(
--     "n",
--     "<leader>fp",
--     function()
--         local current_buffer_path = vim.fn.expand('%')
--         vim.fn.setreg('+', )
--         require("notify")("file path -> ".." writen to clipboard register \'+\'")
--     end,
--     { desc = "file path" }
-- )
vim.keymap.set("n", "<leader>fP", ":edit ~/.config/nvim/init.lua<cr>", { desc = "edit private config" })
vim.keymap.set("n", "<leader>fd", ":w !diff % -<cr>", { desc = "diff of current file" })
-- vim.keymap.set(
--     "n",
--     "<leader>fd",
--     ":command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis | wincmd p | diffthis",
--     { desc = "diff of current file" })
-- }}}
-- folds {{{
vim.keymap.set("n", "<leader>o", "za", { desc = "toggle fold" })
vim.keymap.set("n", "<leader>fo", "zO", { desc = "toggle fold" })
vim.keymap.set("n", "<leader>fO", function()
    if vim.o.foldlevel == 255 then
        vim.o.foldlevel = 0
    else
        vim.o.foldlevel = 255
    end
end, { desc = "toggle all folds" })
-- }}}
-- -- quick macro {{{
-- local recording_macro = false
-- vim.keymap.set("n", "q", function()
--     if not recording_macro then
--         -- vim.cmd.normal("q")
--         -- vim.cmd.normal("q")
--         require("notify")("macro recording...")
--         recording_macro = true
--     else
--         -- vim.cmd.normal("q")
--         require("notify")("macro saved")
--         recording_macro = false
--     end
-- end)
-- -- }}}
-- toggle {{{
vim.keymap.set("n", "<leader>tl", ":set nu! rnu!<cr>", { desc = "toggle linenumbers" })
vim.keymap.set("n", "<leader>tw", ":set wrap!<cr>", { desc = "toggle line wrapping" })
-- TODO: scroll lock
-- outline:
--  cursor movement moves screen instead of cursor position
--  motion keys that normally need modifier keys do not while scroll lock is active
--  keep any option changes within local buffer
--  handle unforseen escapes eg. switch tab/win/buf, killing terminal
--
-- vim.keymap.set("n", "<leader>tu", "", { desc = "toggle linenumbers" })
-- vim.keymap.set("n", "<leader>td", "", { desc = "toggle linenumbers" })
-- }}}
-- pattern search {{{
-- reset highlights
vim.keymap.set("n", "<esc>", ":noh<cr><esc>")
-- search word under cursor
-- NOTE: idk if i need this
-- vim.keymap.set("n", "gn", "*")
-- vim.keymap.set("n", "gN", "#")
--
-- TODO: search direction dynamic toggle
-- outline:
--  'n' always gives the next result according to the search direction
--  'N' reverses current search direction
--
-- vim.keymap.set("n", "<>", ":noh<cr><esc>")
-- vim.keymap.set("N", "<>", ":noh<cr><esc>")
-- }}}
-- utility {{{
vim.keymap.set("n", "<leader>ur", ":nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>", { desc = "reset gui highlights" })
vim.keymap.set("n", "<leader>uh", ":messages<CR>", { desc = "message history" })
vim.keymap.set("n", "<leader>ul", ":Lazy<cr>", { desc = "lazy" })
vim.keymap.set("n", "<leader>um", ":Mason<cr>", { desc = "mason" })
-- }}}
-- up/down {{{
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- }}}
-- add undo break-points {{{
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")
-- }}}
-- visual indenting {{{
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
-- vim.keymap.set("n", "<leader>xl", ":lopen<cr>", { desc = "open location list" })
-- vim.keymap.set("n", "<leader>xq", ":copen<cr>", { desc = "open quickfix list" })
-- }}}
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
                ["<leader>f"] = { name = "+file" },
                ["<leader>s"] = { name = "+search" },
                ["<leader>g"] = { name = "+git" },
                ["<leader>c"] = { name = "+code" },
                ["<leader>u"] = { name = "+utility" },
                ["<leader>w"] = { name = "+windows" },
                ["<leader>x"] = { name = "+diagnostics/quickfix" },
                ["<leader>gs"] = { name = "+surround" },
            })
        end,
    },
    -- }}}
    -- telescope.nvim {{{
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>.",  ":Telescope find_files cwd=true<cr>",       desc = "find files (cwd)" },
            { "<leader>/",  ":Telescope current_buffer_fuzzy_find<cr>", desc = "find in buffer" },
            { "<leader>:",  ":Telescope command_history<cr>",           desc = "command history" },
            -- buffer
            -- NOTE: not using buffer menu, only need switch buffer for now
            { "<leader>b",  ":Telescope buffers<cr>",                   desc = "switch buffer" },
            -- file
            { "<leader>f.", ":Telescope find_files<cr>",                desc = "find (root)" },
            { "<leader>f/", ":Telescope live_grep cwd=true<cr>",        desc = "grep (cwd)" },
            { "<leader>fr", ":Telescope oldfiles<cr>",                  desc = "recent file" },
            -- search
            { "<leader>sf", ":Telescope find_files<cr>",                desc = "files" },
            { "<leader>sb", ":Telescope current_buffer_fuzzy_find<cr>", desc = "current buffer" },
            { "<leader>sg", ":Telescope live_grep<cr>",                 desc = "grep" },
            { "<leader>so", ":Telescope jumplist<cr>",                  desc = "jumplist" },
            { "<leader>sm", ":Telescope marks<cr>",                     desc = "marks" },
            { "<leader>s:", ":Telescope commands<cr>",                  desc = "commands" },
            { "<leader>sh", ":Telescope help_tags<cr>",                 desc = "nvim help pages" },
            -- lsp
            { "<leader>cd", ":Telescope diagnostics<cr>",               desc = "diagnostics" },
            -- git
            { "<leader>gc", ":Telescope git_commits<CR>",               desc = "commits" },
            { "<leader>gs", ":Telescope git_status<CR>",                desc = "status" },
            -- help
            { "<leader>hh", ":Telescope help_tags<cr>",                 desc = "search nvim help pages" },
            { "<leader>ht", ":Telescope colorscheme<cr>",               desc = "switch colorscheme" },
            { "<leader>hm", ":Telescope man_pages<cr>",                 desc = "search man pages" },
            { "<leader>hv", ":Telescope vim_options<cr>",               desc = "search nvim options" },
            { "<leader>hl", ":Telescope highlights<cr>",                desc = "search highlight groups" },
            { "<leader>hk", ":Telescope keymaps<cr>",                   desc = "show the keymap" },
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
        },
        opts = {
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                mappings = {
                    n = {
                        ["q"] = function(...) require("telescope.actions").close(...) end,
                        ["c"] = function(...) require("telescope.actions").close(...) end,
                        ["o"] = function(...) require("telescope.actions").close(...) end,
                        ["m"] = function(...) require("telescope.actions").select_default(...) end,
                    },
                    i = {
                        -- [",,"] = function(...) require("telescope.actions").close(...) end,
                        ["<m-c>"] = function(...) require("telescope.actions").close(...) end,
                        ["<m-,>"] = function(...) require("telescope.actions").close(...) end,
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
                jumplist = { initial_mode = "normal", theme = "dropdown" },
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
    -- lsp setup {{{
    -- {
    --     'VonHeikemen/lsp-zero.nvim',
    --     branch = 'v3.x',
    --     lazy = true,
    --     config = false,
    --     init = function()
    --         -- Disable automatic setup, we are doing it manually
    --         vim.g.lsp_zero_extend_cmp = 0
    --         vim.g.lsp_zero_extend_lspconfig = 0
    --     end,
    -- },
    -- {
    --     'williamboman/mason.nvim',
    --     lazy = false,
    --     config = true,
    -- },
    -- cmp {{{
    -- {
    --     'hrsh7th/nvim-cmp',
    --     event = 'InsertEnter',
    --     dependencies = {
    --         { 'L3MON4D3/LuaSnip' },
    --     },
    --     config = function()
    --         -- Here is where you configure the autocompletion settings.
    --         local lsp_zero = require('lsp-zero')
    --         lsp_zero.extend_cmp()
    --
    --         -- And you can configure cmp even more, if you want to.
    --         local cmp = require('cmp')
    --         local cmp_action = lsp_zero.cmp_action()
    --
    --         cmp.setup({
    --             formatting = lsp_zero.cmp_format(),
    --             mapping = cmp.mapping.preset.insert({
    --                 ['<Tab>'] = cmp_action.luasnip_supertab(),
    --                 ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    --                 ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    --                 ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    --                 ['<CR>'] = function(fallback)
    --                     if cmp.visible() then cmp.confirm() else fallback() end
    --                 end,
    --                 ['<C-y>'] = cmp.mapping.complete(),
    --                 ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    --                 ['<C-d>'] = cmp.mapping.scroll_docs(4),
    --             })
    --         })
    --     end
    -- },
    -- }}}
    -- nvim-lspconfig {{{
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            {
                'VonHeikemen/lsp-zero.nvim',
                branch = 'v3.x',
                lazy = true,
                config = false,
                init = function()
                    -- Disable automatic setup, we are doing it manually
                    vim.g.lsp_zero_extend_cmp = 0
                    vim.g.lsp_zero_extend_lspconfig = 0
                end,
            },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            {
                'hrsh7th/nvim-cmp',
                event = 'InsertEnter',
                dependencies = { { 'L3MON4D3/LuaSnip' } }
            },
            { 'hrsh7th/cmp-nvim-lsp' },
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()
            lsp_zero.extend_lspconfig()

            local cmp = require('cmp')
            local cmp_action = lsp_zero.cmp_action()

            cmp.setup({
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    ['<Tab>'] = cmp_action.luasnip_supertab(),
                    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                    ['<CR>'] = function(fallback)
                        if cmp.visible() then
                            cmp.confirm({select = true})
                        else
                            fallback()
                        end
                    end,
                    ['<C-y>'] = cmp.mapping.complete(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                })
            })

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    lsp_zero.default_setup,
                    -- (Optional) Configure lua language server for neovim
                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                }
            })
        end
    },
    -- }}}
    -- }}}
    -- trouble.nvim {{{
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        opts = { use_diagnostic_signs = true },
        keys = {
            { "<leader>xx", ":TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics (Trouble)" },
            { "<leader>xX", ":TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
        },
    },
    -- }}}
    -- todo-comments.nvim {{{
    {
        "folke/todo-comments.nvim",
        event = "BufReadPost",
        config = true,
        -- stylua: ignore
        keys = {
            { "]t",         function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
            { "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
            { "<leader>xt", ":TodoTrouble<cr>",                                  desc = "Todo (Trouble)" },
            { "<leader>xT", ":TodoTrouble keywords=TODO,FIX,FIXME<cr>",          desc = "Todo/Fix/Fixme (Trouble)" },
            { "<leader>ft", ":TodoTelescope<cr>",                                desc = "todo comments in file" },
        },
    },
    -- }}}
    -- neo-tree.nvim {{{
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>e", ":Neotree toggle<CR>", mode = { "n" }, desc = 'neotree' }
        },
        opts = {
            filesystem = {
                follow_current_file = {
                    enabled = true,
                },
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
    { "tpope/vim-repeat",                            event = "VeryLazy" },
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
                map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
                map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
                map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
                map("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")
                map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame Line")
                map("n", "<leader>gd", gs.diffthis, "Diff This")
                map("n", "<leader>gD", function() gs.diffthis("~") end, "Diff This ~")
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
            require("mini.surround").setup(opts)
        end,
    },
    -- }}}
    -- noice.nvim {{{
    { "MunifTanjim/nui.nvim",        lazy = true },
    {
        "rcarriga/nvim-notify",
        lazy = true,
        opts = {
            render = "wrapped-compact",
            timeout = 3000,
            max_height = function() return math.floor(vim.o.lines * 0.75) end,
            max_width = function() return math.floor(vim.o.columns * 0.75) end,
        },
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<leader>ud",
                function() require("notify").dismiss({ silent = true, pending = true }) end,
                desc = "dismiss all notifications",
            },
            -- {
            --     "<leader>uh",
            --     ":Notifications<cr>",
            --     desc = "notifications history"
            -- },
        },
        opts = {
            -- cmdline = {
            --     -- view = "cmdline_popup", -- floating window cmdline (default)
            --     -- view = "cmdline", -- normal position cmdline
            -- },
            lsp = {
                hover = { enabled = false },
                signature = { enabled = false },
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = false,        -- use a classic bottom cmdline for search
                command_palette = true,       -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = true,        -- add a border to hover docs and signature help
            },
        },
        config = function(_, opts) require("noice").setup(opts) end,
    },
    -- }}}
    -- lualine {{{
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                theme = "auto",
                icons_enabled = true,
                globalstatus = true,
                -- disabled_filetypes = { statusline = { "dashboard", "alpha" } },
                section_separators = '',
                component_separators = '',
            },
            sections = {
                lualine_a = { 'mode', separator = nil },
                lualine_b = { 'branch', separator = nil },
                lualine_c = {
                    'diagnostics',
                    { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                    { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
                },
                lualine_x = {
                    {
                        function() return require("noice").api.status.command.get() end,
                        cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
                    },
                    {
                        function() return require("noice").api.status.mode.get() end,
                        cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
                    },
                    {
                        function() return "  " .. require("dap").status() end,
                        cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
                    },
                    { require("lazy.status").updates, cond = require("lazy.status").has_updates },
                    "diff",
                },
                lualine_y = {
                    { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
                    { "location", padding = { left = 0, right = 1 } },
                },
                lualine_z = { 'location', separator = nil }
            },
            extensions = { "neo-tree", "lazy" },
        },
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
        lazy = true,
        name = "tokyonight",
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
    {
        "bluz71/vim-moonfly-colors",
        lazy = true,
        name = "moonfly",
    },
    {
        "bluz71/vim-nightfly-guicolors",
        lazy = true,
        name = "nightfly",
    },
    {
        "embark-theme/vim",
        lazy = true,
        name = "embark"
    },
    {
        "arcticicestudio/nord-vim",
        lazy = true,
        name = "nord",
    },
    {
        "junegunn/seoul256.vim",
        lazy = true,
        name = "seoul256",
    },
    {
        "rose-pine/neovim",
        lazy = true,
        name = "rose_pine",
        opts = {
            dark_variant = "moon",
            disable_italics = true,
        }
    },
    {
        "sainnhe/everforest",
        lazy = true,
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
        lazy = true,
        name = "tundra",
        opts = { background = "dark" },
    },
    {
        "drewtempelmeyer/palenight.vim",
        lazy = true,
        name = "palenight",
    },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = true,
        name = "gruvbox",
        opts = { background = "dark" }
    },
    -- }}}
}

vim.cmd.colorscheme("catppuccin")
