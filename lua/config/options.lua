vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.termguicolors = true

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.wrap = true
opt.number = true
opt.relativenumber = true
opt.laststatus = 2
opt.shiftwidth = 2
opt.tabstop = 2
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.mouse = "a" -- Enable mouse mode
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.cursorline = true -- Enable highlighting of the current line
opt.autowrite = true -- Enable auto write
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.showmode = false -- Dont show mode since we have a statusline
opt.smartcase = true -- Don't ignore case with capitals
opt.autoindent = true
opt.smartindent = true -- Insert indents automatically
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.smarttab = true
opt.formatoptions = "jcroqlnt" -- tcqj
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current

opt.spelllang = "en_us"
opt.spell = true

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
