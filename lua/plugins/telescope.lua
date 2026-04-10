return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        -- Performance
        file_ignore_patterns = {
          "%.git/",
          "node_modules/",
          "target/",
          "build/",
          "dist/",
          "__pycache__/",
        },

        -- Better UX
        path_display = { "smart" },

        -- ripgrep config (for live_grep)
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--no-ignore",
          "--follow",
        },
      },

      pickers = {
        find_files = {
          find_command = {
            "fd",
            "--type", "f",
            "--hidden",
            "--follow",
            "--strip-cwd-prefix",
            "--exclude", ".git",
            "--exclude", "node_modules",
            "--exclude", "target",
            "--exclude", "build",
          },
        },

        git_files = {
          recurse_submodules = true,
        },
      },
    },
  },
}
