return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Astral Python stack, installed via `uv tool install` (not in Mason).
        -- mason = false -> use the binaries already on PATH (~/.local/bin).
        ty = { mason = false }, -- type checker / LSP
        ruff = { mason = false }, -- linter + formatter
      },
    },
  },
}
