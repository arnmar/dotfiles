return {
    {
        'nvim-neotest/neotest',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
            'antoinemadec/FixCursorHold.nvim'
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-python")({
                        dap = { justMyCode = false },
                    }),
                },
            })
            vim.keymap.set('n', '<leader>rt', require("neotest").run.run)
        end,
        cond = not vim.g.vscode
    },
    {
        'nvim-neotest/neotest-python',
    },
}
