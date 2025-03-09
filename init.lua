local opt = vim.opt
local keymap = vim.keymap.set
local km_ops = {noremap = true, silent = true}


-------------------
----- Options -----
-------------------

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

opt.splitright = true
opt.splitbelow = true



--------------------
------ Keymaps------
--------------------

keymap("v", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

--paste without yanking
keymap("v", "p", '"_dP', opts)

-- keep selection after indenting
keymap("x", "<", "<gv", km_opts)
keymap("x", ">", ">gv", km_opts)

-- move text up and down
keymap("n", "<C-j>", ":m .+1<CR>", km_opts)
keymap("n", "<C-k>", ":m .-2<CR>", km_opts)
keymap("x", "<C-j>", ":m '>+1<CR>gv=gv", km_opts)
keymap("x", "<C-k>", ":m '<-2<CR>gv=gv", km_opts)

-- duplicate lines
keymap("n", "<A-j>", ":t .<CR>", km_opts)
keymap("n", "<A-k>", ":t .-1<CR>", km_opts)
keymap("x", "<A-k>", ":t '><CR>gv=gv", km_opts)
keymap("x", "<A-j>", ":t '<-1<CR>gv=gv", km_opts)


-- built in completion
opt.completeopt = { "menu", "menuone", "noinsert" }
keymap("i", "<Tab>", "pumvisible() ? '<C-y>' : '<Tab>'", {expr = true, noremap = true})
keymap("i", "j", "pumvisible() ? '<C-n>' : 'j'", {expr = true, noremap = true})
keymap("i", "k", "pumvisible() ? '<C-p>' : 'k'", {expr = true, noremap = true})
keymap("i", "<Esc>", "pumvisible() ? '<C-e>' : '<Esc>'", { expr = true, noremap = true })
keymap("i", "<Space>", "pumvisible() ? '<C-e> ' : ' '", { expr = true, noremap = true })


-- File explorer
vim.cmd("let g:netrw_liststyle = 3") -- so built in file explorer uses tree list style
keymap("n", "<F2>", ":if exists('g:loaded_netrw') && &filetype == 'netrw' | bd | else | :Ex | endif<CR>", { noremap = true, silent = true })

-- Splits
keymap("n", "<Leader>l", "<C-w>l", km_opts)
keymap("n", "<Leader>h", "<C-w>h", km_opts)






-- load plugins
require("plugin_configs.treesitter")

-- load language servers
require("ls_configs.clangd")


-- custom file types
vim.filetype.add({
  extension = {
    pde = "java",
  },
})




