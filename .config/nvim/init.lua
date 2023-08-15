vim.g.mapleader = ','

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

require("lazy").setup('core.plugins', {dev = {path = "~/src/nvim/plugins"}})

-- Plugins
-- if vim.g.vscode then
-- else
-- end

-- Vim commands
vim.cmd([[
au TextYankPost * silent! lua vim.highlight.on_yank()
]])

