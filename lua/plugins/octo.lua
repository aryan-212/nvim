return {
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>pr", "<cmd>Octo pr list<CR>", desc = "List PRs" },
      { "<leader>po", "<cmd>Octo pr checkout<CR>", desc = "Checkout PR" },
      { "<leader>ps", "<cmd>Octo review start<CR>", desc = "Start review" },
    },
    config = function()
      require("octo").setup({ use_local_fs = true })
      require("telescope").load_extension("octo")
    end,
  },
}
