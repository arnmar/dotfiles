require('mason').setup()

require('mason-lspconfig').setup({
    ensure_installed = {'pylsp', 'clangd', 'lua_ls'},
    automatic_installation = true,
})
