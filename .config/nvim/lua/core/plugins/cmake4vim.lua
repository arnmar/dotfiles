return {
    'ilyachur/cmake4vim',
    config = function()
        vim.keymap.set('n', '<F7>', '<cmd>CMakeBuild<cr>')
    end
}
