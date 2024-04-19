return { 'ilyachur/cmake4vim',
    config = function()
        vim.keymap.set('n', '<leader>cc', '<cmd>CMakeBuild<CR>')
        vim.keymap.set('n', '<leader>tt', '<cmd>CTest --output-on-failure<CR>')
    end,
}
