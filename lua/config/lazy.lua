local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
vim.opt.swapfile = false
--- Use the following to make a command run on its own on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("ASEnable")
  end,
})
vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5
vim.o.guifont = "Fira Code iScript:h17" -- text below applies for VimScript

-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end
-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_transparency = 0.7
vim.g.transparency = 0.1
vim.g.neovide_background_color = "#0fffff" .. alpha()
vim.g.neovide_theme = "auto"

-- require("autosave.action").enable()
require("lazy").setup({
  spec = {
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

    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import any extras modules here
    {
      "nvimdev/dashboard-nvim",
      event = "VimEnter",
      opts = function(_, opts)
        local logo = [[
        
   ▄████████    ▄████████ ▄██   ▄   ███▄▄▄▄    ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄   
  ███    ███   ███    ███ ███   ██▄ ███▀▀▀██▄ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄ 
  ███    ███   ███    ███ ███▄▄▄███ ███   ███ ███    ███ ███▌ ███   ███   ███ 
  ███    ███  ▄███▄▄▄▄██▀ ▀▀▀▀▀▀███ ███   ███ ███    ███ ███▌ ███   ███   ███ 
▀███████████ ▀▀███▀▀▀▀▀   ▄██   ███ ███   ███ ███    ███ ███▌ ███   ███   ███ 
  ███    ███ ▀███████████ ███   ███ ███   ███ ███    ███ ███  ███   ███   ███ 
  ███    ███   ███    ███ ███   ███ ███   ███ ███    ███ ███  ███   ███   ███ 
  ███    █▀    ███    ███  ▀█████▀   ▀█   █▀   ▀██████▀  █▀    ▀█   ███   █▀  
               ███    ███                                                     

      ]]

        logo = string.rep("\n", 8) .. logo .. "\n\n"
        opts.config.header = vim.split(logo, "\n")
      end,
    },
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
  checker = { enabled = true }, -- automatically check for plugin updates
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
