-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<esc>", { desc = "Better escape" })
vim.keymap.set("i", "jk", "<esc>", { desc = "Better escape" })

vim.keymap.set("n", "<F3>", "<cmd>CMakeStopRunner<cr>", { desc = "CMake Stop Runner" })
vim.keymap.set("n", "<F4>", "<cmd>CMakeClean<cr>", { desc = "CMake Clean" })
vim.keymap.set("n", "<F5>", "<cmd>CMakeDebug<cr>", { desc = "CMake Debug" })
vim.keymap.set("n", "<S-F5>", "<cmd>CMakeRun<cr>", { desc = "CMake Run" })
vim.keymap.set("n", "<S-F2>", "<cmd>CMakeGenerate<cr>", { desc = "CMake Select Preset" })
vim.keymap.set("n", "<F2>", "<cmd>CMakeSelectBuildPreset<cr>", { desc = "CMake Select Preset" })
vim.keymap.set("n", "<F7>", "<cmd>CMakeBuild<cr>", { desc = "CMake Build" })
vim.keymap.set("n", "<S-F7>", "<cmd>CMakeStopExecutor<cr>", { desc = "CMake Stop Build" })
vim.keymap.set("n", "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header (C/C++)" })

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
