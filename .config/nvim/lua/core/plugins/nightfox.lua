if not vim.g.vscode then
    return {
        'EdenEast/nightfox.nvim',
        config = function()
            vim.cmd([[colorscheme nightfox]])
        end,
    }
end
