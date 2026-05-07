-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Ensure virtual text diagnostics are disabled after LSP setup
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.diagnostic.config({ virtual_text = false })
  end,
})

-- tiny-inline-diagnostic doesn't render inside vim's diff mode (used by
-- github-pr-reviewer's <C-v> split view), so squigglies show but the message
-- doesn't. Re-enable native virtual_text per-buffer while a window is in diff
-- mode, and turn it back off when leaving diff.
local function sync_diff_diagnostics()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.diagnostic.config({ virtual_text = vim.wo.diff }, bufnr)
end

vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
  callback = sync_diff_diagnostics,
})

vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "diff",
  callback = sync_diff_diagnostics,
})
