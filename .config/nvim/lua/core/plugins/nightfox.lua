local config = {
    'EdenEast/nightfox.nvim',
    config = function()
        vim.cmd([[colorscheme nightfox]])
    end,
}

return vim.g.vscode and {} or config
