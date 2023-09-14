return {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup()
    end,
    cond = not vim.g.vscode
}
