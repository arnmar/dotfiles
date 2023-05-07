vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('plugins')
require('mason').setup()
require('mason-lspconfig').setup()
require('lspconfig').clangd.setup{}
require('bufferline').setup()
require('telescope-config')
require('mini.bracketed').setup()
require('leap').add_default_mappings()
require('nvim-tree').setup()
require('lualine').setup()

vim.opt.expandtab = true --Transform spaces to tabs
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.termguicolors = true

vim.g.mapleader = ','

-- Keybindings
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')
vim.keymap.set('i', 'jj', '<esc>') --Reload lua file
vim.keymap.set('n', '<leader>r', '<cmd>luafile %<cr>') --Reload lua file
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>') --Save
vim.keymap.set({'n', 'x'}, 'cy', '"+y') --Copy to system clipboard
vim.keymap.set({'n', 'x'}, 'cp', '"+p') --Paste from system clipboard
-- Telescope keybindings
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fgb', '<cmd>Telescope git_branches<CR>')
vim.keymap.set('n', '<leader>fgf', '<cmd>Telescope git_files<CR>')
vim.keymap.set('n', '<leader>fgc', '<cmd>Telescope git_commits<CR>')
-- Nvim Tree keybindings
vim.keymap.set('n', '<F3>', '<cmd>NvimTreeToggle<CR>')

-- Vim commands
vim.cmd([[
au TextYankPost * silent! lua vim.highlight.on_yank()
colorscheme nightfox
]])

