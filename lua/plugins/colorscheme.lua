return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(hl, c)
        hl.DiffAdd = { bg = "#20303b" }
        hl.DiffChange = { bg = "#1f2233" }
        hl.DiffDelete = { bg = "#3b2020" }
      end,
    },
  },
}
