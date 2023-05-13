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
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc  = '[?] Find recently opened files'})
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc  = '[F]ind [F]iles'})
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc  = '[F]ind [H]elp'})
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fgb', '<cmd>Telescope git_branches<CR>')
vim.keymap.set('n', '<leader>fgf', '<cmd>Telescope git_files<CR>')
vim.keymap.set('n', '<leader>fgc', '<cmd>Telescope git_commits<CR>')

-- Nvim Tree keybindings
vim.keymap.set('n', '<F3>', '<cmd>NvimTreeToggle<CR>')
