vim.keymap.set('n', '<C-Up>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')
vim.keymap.set('i', 'jj', '<esc>')
vim.keymap.set('n', '<leader>r', '<cmd>luafile %<cr>') -- Reload lua file
vim.keymap.set('n', '<leader>s', '<cmd>write<cr>') -- Save
vim.keymap.set({'n', 'x'}, 'cy', '"+y') -- Copy to system clipboard
vim.keymap.set({'n', 'x'}, 'cp', '"+p') -- Paste from system clipboard
-- vim.keymap.set('n', '<leader>sr', ':%s/<C-R><C-W>/<C-R><C-W>/gc<C-F>F/i') -- Search and replace
