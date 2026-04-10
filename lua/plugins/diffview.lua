return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose" },
    keys = {
      {
        "<leader>gd",
        function()
          vim.cmd("DiffviewOpen origin/main...HEAD")
        end,
        desc = "Diff vs main (PR view)",
      },
      {
        "<leader>gD",
        function()
          vim.cmd("DiffviewClose")
        end,
        desc = "Close diffview",
      },
    },
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true,
        view = {
          merge_tool = {
            layout = "diff3_mixed",
          },
        },
        file_panel = {
          win_config = {
            position = "left",
            width = 35,
          },
        },
      })
    end,
  },
}
