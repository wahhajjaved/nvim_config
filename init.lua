local opt = vim.opt

vim.cmd("let g:netrw_liststyle = 3") -- so built in file explorer uses tree list style

opt.relativenumber = true
opt.number = true

-- indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false -- expand tab to spaces
opt.autoindent = true

opt.wrap = false
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- case sensitive search if search string is mixed case

opt.termguicolors = true
opt.background = "dark"
vim.cmd [[colorscheme onedark]]

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus") -- use system clipboard as default register

opt.splitright = true
opt.splitbelow = true



-- load plugins
require("plugin_configs.treesitter")

-- load language servers
require("ls_configs.clangd")

