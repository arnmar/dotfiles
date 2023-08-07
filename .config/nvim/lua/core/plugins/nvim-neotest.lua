return {
    { 'nvim-neotest/neotest',
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
                    })
                },
            })
        end,
    },
    { 'nvim-neotest/neotest-python',
        config = function()
        end,
    }
}
