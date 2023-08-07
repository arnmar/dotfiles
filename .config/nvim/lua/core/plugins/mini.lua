return {
    'echasnovski/mini.nvim',
    config = function()
        require('mini.bracketed').setup()
        require('mini.surround').setup {
            mappings = {
                add = 'ys', -- Add surrounding in Normal and Visual modes
                delete = 'ds', -- Delete surrounding
                find = 'fs', -- Find surrounding (to the right)
                replace = 'rs', -- Replace surrounding
            }
        }
    end,
}
