local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
vim.opt.swapfile = false
--- Use the following to make a command run on its own on startup
vim.g.neovide_scale_factor = 1.2
vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5
vim.o.guifont = "Iosevka Term Nerd Font:h18" -- text below applies for VimScript

-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end
-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_transparency = 0.7
vim.g.transparency = 0.1
vim.g.neovide_background_color = "#0fffff" .. alpha()
vim.g.neovide_theme = "auto"
vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_cursor_vfx_opacity = 100.0
vim.g.neovide_cursor_vfx_particle_lifetime = 0.7
vim.g.neovide_cursor_vfx_particle_density = 100.0

-- require("autosave.action").enable()e
require("lazy").setup({
  spec = {
    {
      "kawre/leetcode.nvim",
      build = ":TSUpdate html",
      dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim", -- required by telescope
        "MunifTanjim/nui.nvim",

        -- optional
        "nvim-treesitter/nvim-treesitter",
        -- "rcarriga/nvim-notify",
        "nvim-tree/nvim-web-devicons",
      },
      opts = {
        -- configuration goes here
      },
    },
    -- {
    --   "rachartier/tiny-inline-diagnostic.nvim",
    --   event = "VeryLazy", -- Or `LspAttach`
    --   priority = 1000, -- needs to be loaded in first
    --   config = function()
    --     require("tiny-inline-diagnostic").setup()
    --     vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
    --   end,
    -- },
    {
      "mrcjkb/rustaceanvim",
      version = "^6", -- Recommended
      lazy = false, -- This plugin is already lazy
    },
    {
      "mistricky/codesnap.nvim",
      build = "make build_generator",
      keys = {
        { "<leader>mc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
        { "<leader>ko", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
      },
      opts = {
        save_path = "~/Pictures",
        has_breadcrumbs = true,
        bg_theme = "bamboo",
      },
    },
    {
      "barrett-ruth/live-server.nvim",
      build = "pnpm add -g live-server",
      cmd = { "LiveServerStart", "LiveServerStop" },
      config = true,
    },
    {
      "olrtg/nvim-emmet",
      config = function()
        vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
      end,
    },
    {
      "0x00-ketsu/autosave.nvim",
      -- lazy-loading on events
      event = { "InsertLeave", "TextChanged" },
      config = function()
        require("autosave").setup({
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
          write_on_bufleave = true,
          condition = function(buf)
            local fn = vim.fn
            local undotree = vim.fn.undotree()
            if undotree.seq_last ~= undotree.seq_cur then
              return false -- don't try to save again if I tried to undo. k thanks
            end
          end
        })
      end,
    },
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          pyright = {
            on_init = function(client)
              local cwd = vim.fn.getcwd()
              local venv_path = cwd .. "/.venv/bin/python"
              if vim.fn.filereadable(venv_path) == 1 then
                client.config.settings.python.pythonPath = venv_path
                client.notify("workspace/didChangeConfiguration", {
                  settings = client.config.settings,
                })
              end
            end,
            settings = {
              python = {
                analysis = {
                  autoSearchPaths = true,
                  diagnosticMode = "openFilesOnly",
                  useLibraryCodeForTypes = true,
                },
              },
            },
          },
        },
      },
    },

    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import any extras modules here
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },

    --{ //import = "lazyvim.plugins.extras.ui.mini-animate" },
    { "CRAG666/code_runner.nvim", config = true },
    "0x00-ketsu/autosave.nvim",
    -- lazy-loading on events
    event = { "InsertLeave", "TextChanged" },
    config = function()
      require("autosave").setup({
        enabled = true,
        debounce_delay = 135,

        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        write_on_bufleave = true,
        condition = function(buf)
          local fn = vim.fn
          local undotree = vim.fn.undotree()
          if undotree.seq_last ~= undotree.seq_cur then
            return false -- don't try to save again if I tried to undo. k thanks
          end
        end
      })
    end,

    -- import/override with your plugins
    { import = "plugins" },
  },

  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "habamax", "habamax" } },
  -- checker = { enabled = true, notify = flase }, -- automatically check for plugin updates
  checker = {
    -- automatically check for plugin updates
    enabled = false,
    concurrency = nil, ---@type number? set to 1 to check for updates very slowly
    notify = true, -- get a notification when new updates are found
    frequency = 3600, -- check for updates every hour
    check_pinned = false, -- check for pinned packages that can't be updated
  },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
