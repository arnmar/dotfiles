local has_mason = pcall(require, 'mason')
if not has_mason then
    return
end

require('mason').setup()

require('mason-lspconfig').setup({
    ensure_installed = {'pylsp', 'clangd', 'lua_ls'},
    automatic_installation = true,
})
