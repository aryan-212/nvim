local opt = vim.opt
opt.wrap = true -- Enable line wrap
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.snacks_animate = false

-- Python: Astral stack (uv + ruff + ty). Use ty as the LSP instead of pyright.
vim.g.lazyvim_python_lsp = "ty"
vim.g.lazyvim_python_ruff = "ruff"
