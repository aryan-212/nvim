-- rust-analyzer tuning for the e6 workspaces (~1000 packages once the
-- arrow/datafusion/iceberg forks are pulled in). Overrides lazyvim.plugins.extras.lang.rust.
return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        -- The toolchain's rust-analyzer, not Mason's: a newer RA against a pinned rustc
        -- mis-expands format!() to (), which shows up as bogus E0308s on every use.
        -- Find the pin by searching upward -- it sits at the workspace root, above the
        -- crate root, and the rustup shim only reads it from its own cwd.
        cmd = function()
          local dir = vim.fn.expand("%:p:h")
          local pin = vim.fs.find({ "rust-toolchain.toml", "rust-toolchain" }, {
            upward = true,
            path = dir ~= "" and dir or vim.uv.cwd(),
          })[1]
          local channel = pin and table.concat(vim.fn.readfile(pin), "\n"):match('channel%s*=%s*"([^"]+)"')
          if channel then
            return { "rustup", "run", channel, "rust-analyzer" }
          end
          return { vim.fn.expand("~/.cargo/bin/rust-analyzer") }
        end,
        default_settings = {
          ["rust-analyzer"] = {
            cargo = {
              targetDir = true, -- don't fight a terminal `cargo build` for the target lock
              allFeatures = false,
              buildScripts = { enable = true, rebuildOnSave = false },
              extraEnv = { CARGO_NET_OFFLINE = "true" }, -- deps are git forks
            },
            check = {
              -- check.workspace stays true: `cargo check -p <crate>` resolves a different
              -- feature set and shares no artifacts -- 68s per crate switch vs 7s.
              allTargets = false,
              command = "check", -- clippy on demand: :RustLsp flyCheck
            },
            cachePriming = { enable = false }, -- index on demand
            numThreads = 8, -- of 14, leaves cores for cargo
          },
        },
      },
    },
  },
}
