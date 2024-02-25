-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>cb", ":bd<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader><leader>", ":Telescope find_files hidden=true<CR>", { noremap = true, silent = true })
