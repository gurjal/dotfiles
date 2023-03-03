vim.g.mapleader = " "
vim.g.maplocalleader = " "

local Util = require("util")
local keymap = vim.keymap

keymap.set("i", "jk", "<esc>", { silent = true })

-- file
keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "quit" })
keymap.set("n", "<leader>fs", "<cmd>w<cr><esc>", { desc = "save file" })
keymap.set("n", "<leader><space>", "<cmd>wq<cr><esc>", { desc = "save file and quit" })

-- better up/down
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Go to
keymap.set("n", "gh", "0", { desc = "Go to line start" })
keymap.set("n", "gj", "G", { desc = "Go to bottom" })
keymap.set("n", "gk", "gg", { desc = "Go to top" })
keymap.set("n", "gl", "$", { desc = "Go to line end" })

-- buffers
keymap.set("n", "<a-n>", "<cmd>bnext<cr>", { desc = "next buffer" })
keymap.set("n", "<a-p>", "<cmd>bprevious<cr>", { desc = "prev buffer" })
keymap.set("n", "<leader>b<cr>", "<cmd>enew<cr>", { desc = "new buffer" })
keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "kill buffer" })
keymap.set("n", "<leader>bk", "<cmd>bd<cr>", { desc = "kill buffer" })
keymap.set("n", "<leader>bn", "<cmd>bn<cr>", { desc = "next buffer" })
keymap.set("n", "<leader>bp", "<cmd>bp<cr>", { desc = "prev buffer" })
keymap.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "switch to Other Buffer" })

-- windows
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
keymap.set("n", "<leader>ww", "<C-W>p", { desc = "other window" })
keymap.set("n", "<leader>wd", "<C-W>c", { desc = "delete window" })
keymap.set("n", "<leader>ws", "<C-W>s", { desc = "split window below" })
keymap.set("n", "<leader>wv", "<C-W>v", { desc = "split window right" })

-- tabs
keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close" })
keymap.set("n", "<leader><tab>k", "<cmd>tabclose<cr>", { desc = "Close" })
keymap.set("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next" })
keymap.set("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous" })

-- Clear search with <esc>
keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
keymap.set(
    "n",
    "<leader>ur",
    "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
    { desc = "Redraw / clear hlsearch / diff update" }
)

keymap.set("n", "gw", "*N")
keymap.set("x", "gw", "*N")

-- Add undo break-points
keymap.set("i", ",", ",<c-g>u")
keymap.set("i", ".", ".<c-g>u")
keymap.set("i", ";", ";<c-g>u")

-- better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- lazy
keymap.set("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" })

keymap.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Open Location List" })
keymap.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Open Quickfix List" })

-- toggle options
keymap.set("n", "<leader>uf", require("plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
keymap.set("n", "<leader>us", function()
    Util.toggle("spell")
end, { desc = "Toggle Spelling" })
keymap.set("n", "<leader>uw", function()
    Util.toggle("wrap")
end, { desc = "Toggle Word Wrap" })
keymap.set("n", "<leader>ul", function()
    Util.toggle("relativenumber", true)
    Util.toggle("number")
end, { desc = "Toggle Line Numbers" })
keymap.set("n", "<leader>ud", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
keymap.set("n", "<leader>uc", function()
    Util.toggle("conceallevel", false, { 0, conceallevel })
end, { desc = "Toggle Conceal" })

-- lazygit
keymap.set("n", "<leader>gg", function()
    Util.float_term({ "lazygit" })
end, { desc = "Lazygit (cwd)" })
keymap.set("n", "<leader>gG", function()
    Util.float_term({ "lazygit" }, { cwd = Util.get_root() })
end, { desc = "Lazygit (root dir)" })

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
    keymap.set("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
end

-- floating terminal
keymap.set("n", "<leader>bt", function()
    Util.float_term(nil, { cwd = Util.get_root() })
end, { desc = "Terminal (root dir)" })
keymap.set("n", "<leader>bT", function()
    Util.float_term()
end, { desc = "Terminal (cwd)" })
keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
