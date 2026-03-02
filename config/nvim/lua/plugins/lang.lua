return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            -- "--query-driver=" .. gcc .. "," .. gpp,
          },
          mason = false,
        },
        marksman = {
          mason = false,
        },
        jdtls = {
          handlers = {
            ["language/status"] = function(_, result)
              vim.notify("JDTLS Status: " .. result, vim.log.levels.INFO)
            end,
            ["$/progress"] = function() end,
          },
          init_options = {
            bundles = {},
          },
        },
      },
    },
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.auto_install = false
      opts.ensure_installed = {}
      opts.highlight = opts.highlight or {}
      opts.highlight.enable = true
    end,
    {
      "dmmulroy/ts-error-translator.nvim",
      opts = {},
    },
  },

  {
    "nvim-flutter/flutter-tools.nvim",
    ft = "dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    opts = {},
  },
  {
    "lommix/godot.nvim",
    ft = "gdscript",
    cmd = { "GodotDebug", "GodotBreakAtCursor", "GodotStep", "GodotQuit", "GodotContinue" },
  },
}
