return {
  "aryan-212/github-pr-reviewer.nvim",
  commit = "adbf5b11b6ab64650504a64f2ce47bf9c18f1615",
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
