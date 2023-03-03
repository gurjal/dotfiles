local opt = vim.opt

-- base
opt.number = true
opt.relativenumber = true
opt.cursorline = false
opt.syntax = "enable"
opt.tabstop = 4
opt.shiftwidth = 0
opt.expandtab = true
opt.textwidth = 100
opt.wrap = false
opt.wrapmargin = 0
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.autoindent = true
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true
opt.showmode = false
opt.mouse = "a"

-- window
opt.cmdheight = 0
opt.laststatus = 0
opt.showtabline = 1
opt.numberwidth = 4
opt.signcolumn = "yes:1"
opt.title = true
opt.titleold = "st"
opt.splitbelow = false
opt.splitright = false
opt.termguicolors = true

-- backup, undo and swap
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.writebackup = true

-- formatting
opt.formatoptions = "jcroqlnt" -- tcqj
opt.joinspaces = false

-- util
vim.cmd("filetype plugin indent on")
opt.spelllang = { "en" }
opt.shortmess:append("sI")
opt.timeoutlen = 500
opt.compatible = false
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.hidden = true
opt.list = true
opt.lazyredraw = false
