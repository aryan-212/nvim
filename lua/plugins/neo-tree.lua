return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        -- Fix for TERM=dumb causing path issues
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            -- Add any patterns that might be causing issues
          },
          never_show = {
            -- Ensure problematic paths are never shown
          },
        },
      },
      -- Add error handling for path resolution
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            -- Ensure proper path handling
            local current_path = vim.fn.getcwd()
            if current_path and current_path ~= "" then
              vim.g.neo_tree_current_path = current_path
            end
          end,
        },
      },
    },
    config = function(_, opts)
      -- Set proper environment variables before loading Neo-tree
      if vim.env.TERM == "dumb" then
        vim.env.TERM = "xterm-256color"
      end
      
      require("neo-tree").setup(opts)
    end,
  },
}
