-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Ensure virtual text diagnostics are disabled after LSP setup
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.diagnostic.config({ virtual_text = false })
  end,
})
