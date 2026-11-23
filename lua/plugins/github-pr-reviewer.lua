return {
  "aryan-212/github-pr-reviewer.nvim",
  commit = "d03f42455e8a76a11fafe92cc70c7341f7bf93bf",
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
