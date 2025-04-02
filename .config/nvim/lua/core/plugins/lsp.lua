return {
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Snippets
    {'L3MON4D3/LuaSnip', version = "v2.*", build = 'make install_jsregexp'},
    {'rafamadriz/friendly-snippets' },
    {'saadparwaiz1/cmp_luasnip'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},
    {'hrsh7th/cmp-cmdline'},
    {'neovim/nvim-lspconfig'},

    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x',
        config = function()
            local lsp_zero = require("lsp-zero")
            local cmp_action = require('lsp-zero').cmp_action()
            local cmp_format = require('lsp-zero').cmp_format()
            lsp_zero.extend_lspconfig()
            lsp_zero.on_attach(function(client, bufnr)
              lsp_zero.default_keymaps({buffer = bufnr})
            end)

            local lspconfig_defaults = require('lspconfig').util.default_config
            lspconfig_defaults.capabilities = vim.tbl_deep_extend('force', lspconfig_defaults.capabilities, require('cmp_nvim_lsp').default_capabilities())

            require('luasnip.loaders.from_vscode').lazy_load()

            -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
            require("neodev").setup({})

            require('lspconfig').pylsp.setup{}
            require('lspconfig').clangd.setup{}
            require('lspconfig').lua_ls.setup {
                settings = {
                    Lua = {
                        diagnostics = { globals = {'vim'} },
                        completion = { callSnippet = "Replace" }
                    }
                }
            }

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
              group = vim.api.nvim_create_augroup('UserLspConfig', {}),
              callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<space>wl', function()
                  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<space>f', function()
                  vim.lsp.buf.format { async = true }
                end, opts)
              end,
            })

            -- local cmp = require('cmp')
            -- cmp.setup({
            --     snippet = {
            --         expand = function(args)
            --             require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            --         end,
            --     },
            --     sources = cmp.config.sources({
            --         -- { name = 'nvim_lua' },
            --         { name = 'nvim_lsp' },
            --         -- { name = 'vsnip' },
            --         { name = 'buffer' },
            --         { name = 'path' },
            --         { name = 'luasnip' },
            --     }),
            --     completion = {
            --         completeopt = 'menu,menuone,noinsert'
            --     },
            --     mapping = cmp.mapping.preset.insert({
            --         ['<C-f>'] = cmp_action.luasnip_jump_forward(),
            --         ['<C-b>'] = cmp_action.luasnip_jump_backward(),
            --     }),
            --     formatting = cmp_format,
            -- })
            --
            -- -- Set configuration for specific filetype.
            -- cmp.setup.filetype('gitcommit', {
            --     sources = cmp.config.sources({
            --         { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
            --     }, {
            --         { name = 'buffer' },
            --     })
            -- })
            --
            -- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            -- cmp.setup.cmdline({ '/', '?' }, {
            --     mapping = cmp.mapping.preset.cmdline(),
            --     sources = {
            --         { name = 'buffer' }
            --     }
            -- })
            --
            -- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            -- cmp.setup.cmdline(':', {
            --     mapping = cmp.mapping.preset.cmdline(),
            --     sources = cmp.config.sources({
            --         { name = 'path' }
            --     }, {
            --         { name = 'cmdline' }
            --     })
            -- })

            require('mason').setup()

            require('mason-lspconfig').setup({
                -- ensure_installed = {'pylsp', 'clangd', 'lua_ls'},
                automatic_installation = true,
                handlers = {
                    lsp_zero.default_setup,
                  },
            })
        end
    }
}
