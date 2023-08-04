local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    { 'tpope/vim-fugitive' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'flazz/vim-colorschemes' },
    { 'ntpeters/vim-better-whitespace' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/vim-vsnip' },
    { 'hrsh7th/vim-vsnip-integ' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
    { 'nvim-lua/plenary.nvim' },
    { 'shatur/neovim-tasks' },
    { 'ggandor/leap.nvim' },
    { 'numToStr/Comment.nvim' },
    { 'echasnovski/mini.nvim' },
    { 'christoomey/vim-tmux-navigator' },
    { 'lukas-reineke/indent-blankline.nvim' },
    { 'nvim-tree/nvim-tree.lua', dependencies = 'nvim-tree/nvim-web-devicons' },
    { 'EdenEast/nightfox.nvim', config = function() vim.cmd([[colorscheme nightfox]]) end,},
    { 'nvim-telescope/telescope.nvim', dependencies = 'nvim-lua/plenary.nvim' },
    { 'akinsho/bufferline.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },
    { 'nvim-lualine/lualine.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
}

local opts = {}

require("lazy").setup(plugins, opts)
