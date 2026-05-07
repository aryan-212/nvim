# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

# ArynVim

# nvimzygit

## GitHub PR Reviewer

[github-pr-reviewer.nvim](https://github.com/aryan-212/github-pr-reviewer.nvim) — review GitHub PRs from inside Neovim with full LSP/navigation.

Requires `gh` CLI authenticated (`gh auth status`).

Keymaps:
- `<leader>gp` (normal) — open PR review menu (`:PRReviewMenu`)
- `<leader>gp` (visual) — suggest change for selected lines (`:PRSuggestChange`)

Note: defaults to `<leader>p`, but that collides with the `yanky` extra (Open Yank History). Remapped to `<leader>gp` under the git group.
