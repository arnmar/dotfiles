return {
    'echasnovski/mini.nvim',
    config = function()
        require('mini.bracketed').setup{}

        require('mini.surround').setup {
            mappings = {
                add = 'za', -- Add surrounding in Normal and Visual modes
                delete = 'zd', -- Delete surrounding
                find = 'zf', -- Find surrounding (to the right
                find_left = 'zF', -- Find surrounding (to the left)
                highlight = 'zh', -- Highlight surrounding
                replace = 'zr', -- Replace surrounding
                update_n_lines = 'zn', -- Update `n_lines`

                suffix_last = 'l', -- Suffix to search with "prev" method
                suffix_next = 'n', -- Suffix to search with "next" method
            }
        }
        require('mini.trailspace').setup {
            -- Highlight only in normal buffers (ones with empty 'buftype'). This is
            -- useful to not show trailing whitespace where it usually doesn't matter.
            only_in_normal_buffers = true,
        }
        require('mini.files').setup()
    end
}
