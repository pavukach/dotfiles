return {
  {
    "hiphish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    config = function()
      require("rainbow-delimiters.setup").setup({
        strategy = {
          [""] = "rainbow-delimiters.strategy.global",
          vim = "rainbow-delimiters.strategy.local",
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        priority = {
          [""] = 110,
          lua = 210,
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      })
    end,
  },
  {
    "nvim-mini/mini.hipatterns",
    opts = function(_, opts)
      local hi = require("mini.hipatterns")

      opts.highlighters = opts.highlighters or {}

      opts.highlighters.dart_color = {
        pattern = "Color%(%s*0x%x+%s*%)",
        group = function(_, match)
          local hex = match:match("0x(%x%x%x%x%x%x%x%x)")

          if #hex == 8 then
            hex = hex:sub(3)
          end

          return hi.compute_hex_color_group("#" .. hex, "bg")
        end,
        extmark_opts = { priority = 2000 },
      }

      return opts
    end,
  },
  {
    "tzachar/highlight-undo.nvim",
    opts = {
      hlgroup = "HighlightUndo",
      duration = 300,
      pattern = { "*" },
      ignored_filetypes = { "neo-tree", "fugitive", "TelescopePrompt", "mason", "lazy" },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      views = {
        hover = {
          border = { style = "rounded" },
        },
      },
      lsp = {
        documentation = {
          view = "hover",
        },
        hover = { silent = true },
      },
    },
  },
}
