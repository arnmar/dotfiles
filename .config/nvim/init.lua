vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = ','

-- User includes
require('user.keybindings')
require('user.options')

-- Plugins
require('plugins')
require('leap').add_default_mappings()
require('mason').setup()
require('mason-lspconfig').setup()
--require('lspconfig').clangd.setup{}
require('bufferline').setup()
require('telescope-config')
require('mini.bracketed').setup()
require('mini-surround-config')
require('nvim-tree').setup()
require('lualine').setup()
require('indent_blankline-config')
require('treesitter-config')

-- Vim commands
vim.cmd([[
au TextYankPost * silent! lua vim.highlight.on_yank()
colorscheme nightfox
]])

