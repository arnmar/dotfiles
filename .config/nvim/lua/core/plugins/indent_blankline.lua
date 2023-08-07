vim.opt.list = true
vim.opt.listchars:append "space:⋅"

return {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        require('indent_blankline').setup {
            show_current_context = true,
            show_current_context_start = true,
        }
    end,
}
