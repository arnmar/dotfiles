local has_lsp_zero = pcall(require, 'lsp-zero')
if not has_lsp_zero then
    return
end

local lsp_zero = require("lsp-zero").preset({})
lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
})

-- then setup your lsp server as usual
local lspconfig = require('lspconfig')
lspconfig.pylsp.setup{}
lspconfig.clangd.setup{}
lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = { globals = {'vim'} },
            completion = { callSnippet = "Replace" }
        }
    }
}

require('mason').setup()

require('mason-lspconfig').setup({
    ensure_installed = {'pylsp', 'clangd', 'lua_ls'},
    automatic_installation = true,
    handlers = {
        lsp_zero.default_setup,
      },
})
