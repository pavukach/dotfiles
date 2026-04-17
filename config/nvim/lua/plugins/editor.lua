return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "esmuellert/codediff.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    cmd = "CodeDiff",
  },
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      use_popups_for_input = true,
      close_if_last_window = true,
      popup_border_style = "rounded",
    },
  },
  {
    "lambdalisue/suda.vim",
    cmd = { "SudaRead", "SudaWrite" },
  },
  {
    "mikesmithgh/kitty-scrollback.nvim",
    enabled = true,
    lazy = true,
    cmd = {
      "KittyScrollbackGenerateKittens",
      "KittyScrollbackCheckHealth",
      "KittyScrollbackGenerateCommandLineEditing",
    },
    event = { "User KittyScrollbackLaunch" },
    version = '*',
    config = function()
      require("kitty-scrollback").setup()
    end,
  },
}
