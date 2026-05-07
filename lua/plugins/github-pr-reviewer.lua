return {
  "aryan-212/github-pr-reviewer.nvim",
  cmd = {
    "PR",
    "PRReviewMenu",
    "PRReview",
    "PRListReviewRequests",
    "PRReviewCleanup",
    "PRReviewBuffer",
    "PRInfo",
    "PROpen",
    "PRLoadLastSession",
    "PRApprove",
    "PRRequestChanges",
    "PRComment",
  },
  opts = {
    picker = "telescope",
  },
  keys = {
    { "<leader>gp", "<cmd>PRReviewMenu<cr>", desc = "PR Review Menu" },
    { "<leader>gp", ":<C-u>'<,'>PRSuggestChange<CR>", desc = "Suggest change", mode = "v" },
  },
}
