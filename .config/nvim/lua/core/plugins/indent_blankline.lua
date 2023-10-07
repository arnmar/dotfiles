return {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    opts = {},
    config = function()
        vim.opt.list = true
        vim.opt.listchars:append "space:⋅"

        require('ibl').setup()
    end,
    cond = not vim.g.vscode
}
