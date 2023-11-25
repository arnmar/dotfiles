return {
    'stevearc/oil.nvim',
    config = function()
        require('oil').setup()
    end,
    cond = not vim.g.vscode
}
