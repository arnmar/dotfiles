require('core.plugins')
require('core.plugin_config')
require('core.options')
require('core.keybindings')

-- Plugins
-- if vim.g.vscode then
-- else
--     require('cmp-config')
--     require('treesitter-config')
-- end

-- Vim commands
vim.cmd([[
au TextYankPost * silent! lua vim.highlight.on_yank()
]])

