return {
    'nvim-telescope/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
        vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc  = '[?] Find recently opened files'})
        vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc  = '[F]ind [F]iles'})
        vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc  = '[F]ind [H]elp'})
        vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
        vim.keymap.set('n', '<leader>fgr', '<cmd>Telescope live_grep<CR>')
        vim.keymap.set('n', '<leader>fgb', '<cmd>Telescope git_branches<CR>')
        vim.keymap.set('n', '<leader>fgf', '<cmd>Telescope git_files<CR>')
        vim.keymap.set('n', '<leader>fgc', '<cmd>Telescope git_commits<CR>')
        vim.keymap.set('n', '<leader>fkm', '<cmd>Telescope keymaps<CR>')
        vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<CR>')

        require('telescope').setup {
            defaults = {
                -- path_display = {"smart"}
            }
        }
        require('telescope').load_extension('cmake4vim')
    end,
}
