return {
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig', cond = not vim.g.vscode},
    {'williamboman/mason.nvim', cond = not vim.g.vscode},
    {'williamboman/mason-lspconfig.nvim', cond = not vim.g.vscode},

    -- Snippets
    {'L3MON4D3/LuaSnip', version = "v2.*", build = 'make install_jsregexp', cond = not vim.g.vscode},

    -- Autocompletion
    {'hrsh7th/nvim-cmp', cond = not vim.g.vscode},
    {'hrsh7th/cmp-buffer', cond = not vim.g.vscode},
    {'hrsh7th/cmp-path', cond = not vim.g.vscode},
    {'hrsh7th/cmp-nvim-lsp', cond = not vim.g.vscode},
    {'hrsh7th/cmp-nvim-lua', cond = not vim.g.vscode},
    {'hrsh7th/cmp-cmdline', cond = not vim.g.vscode},
}
