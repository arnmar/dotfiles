return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-fugitive'
    --use 'bling/vim-airline'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use 'flazz/vim-colorschemes'
    use {
        'akinsho/bufferline.nvim', tag = "*", 
        requires = 'nvim-tree/nvim-web-devicons'
    }
    use {
        'nvim-telescope/telescope.nvim', 
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'echasnovski/mini.nvim'
    use 'ggandor/leap.nvim'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
        require("nvim-tree").setup {}
        end
    }
    use "EdenEast/nightfox.nvim"
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
end)
