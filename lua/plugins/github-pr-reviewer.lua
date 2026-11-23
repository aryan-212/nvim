return {
  "aryan-212/github-pr-reviewer.nvim",
  commit = "aae6f79573187df05c6014da2854b32c70875179",
  cmd = {
    "PR",
    "PRReviewMenu",
    "PRReview",
    "PRListReviewRequests",
    "PRReviewCleanup",
    "PRReviewBuffer",
    "PRReviewCommits",
    "PRReviewMode",
    "PRNextCommit",
    "PRPrevCommit",
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
