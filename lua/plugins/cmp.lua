return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- Enable ghost text for completion suggestions
      opts.experimental = {
        ghost_text = true,
      }
    end,
  },
}
