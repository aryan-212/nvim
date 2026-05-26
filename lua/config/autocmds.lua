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
-- doesn't. Surface diagnostics via a float on cursor hold while in a diff
-- window. (vim.diagnostic.config has no per-buffer virtual_text override, and
-- toggling it globally double-renders with tiny-inline-diagnostic elsewhere.)
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    if vim.wo.diff then
      pcall(vim.diagnostic.open_float, nil, {
        focus = false,
        scope = "cursor",
        border = "rounded",
      })
    end
  end,
})
