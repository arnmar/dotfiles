return {
    {
        'nvim-neotest/neotest',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
            'antoinemadec/FixCursorHold.nvim',
            'nvim-neotest/nvim-nio',
            'nvim-neotest/neotest-python',
            'nvim-neotest/neotest-vim-test',
            -- 'alfaix/neotest-gtest',
            'vim-test/vim-test'
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-python")({
                        dap = { justMyCode = false },
                    }),
                    require("neotest-vim-test")({ ignore_filetypes = { "python", "lua" } }),
                    -- require("neotest-gtest").setup({}),
                },
            })
            vim.keymap.set('n', '<leader>rt', require("neotest").run.run)
        end,
        cond = not vim.g.vscode
    },
    {
    },
}
