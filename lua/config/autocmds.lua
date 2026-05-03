-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Ensure virtual text diagnostics are disabled after LSP setup
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.diagnostic.config({ virtual_text = false })
  end,
})

-- Organize imports on save for Rust (rust-analyzer)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.rs" },
  callback = function()
    local params = vim.lsp.util.make_range_params(0, "utf-8")
    params.context = { only = { "source.organizeImports" }, diagnostics = {} }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 2000)
    for _, res in pairs(result or {}) do
      for _, action in pairs(res.result or {}) do
        if action.edit then
          vim.lsp.util.apply_workspace_edit(action.edit, "utf-8")
        elseif type(action.command) == "table" then
          vim.lsp.buf.execute_command(action.command)
        end
      end
    end
  end,
})
