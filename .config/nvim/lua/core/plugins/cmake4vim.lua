return {
    'ilyachur/cmake4vim',
    cond = not vim.g.vscode,
    config = function()
        vim.keymap.set('n', '<F7>', '<cmd>CMakeBuild<cr>')
    end
}
