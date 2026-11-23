return {
  "aryan-212/github-pr-reviewer.nvim",
  commit = "e595186402a830622a79b6f7770975acf52e236a",
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
