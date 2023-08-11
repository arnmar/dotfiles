return {
    'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
    cond = not vim.g.vscode,
}
