vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ','

-- Plugins
if vim.g.vscode then
    require('leap').add_default_mappings()
    require('mini.bracketed').setup()
    require('mini-surround-config')
    require('Comment').setup()
else
    require('plugins')
    require('leap').add_default_mappings()
    require('mini.bracketed').setup()
    require('mini-surround-config')
    require('mason').setup()
    require('mason-lspconfig').setup()
    require('lspconfig-config')
    require('bufferline').setup()
    require('telescope-config')
    require('nvim-tree').setup()
    require('lualine').setup()
    require('indent_blankline-config')
    require('cmp-config')
    require('treesitter-config')
    require('Comment').setup()
end

-- User includes
require('user.keybindings')
require('user.options')

-- Vim commands
vim.cmd([[
au TextYankPost * silent! lua vim.highlight.on_yank()
colorscheme nightfox
]])

