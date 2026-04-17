return {
  "EdenEast/nightfox.nvim",
  priority = 100,
  config = function()
    require("nightfox").setup({
      groups = {
        all = {
          BlinkCmpMenuBorder = {
            fg = "palette.bg4",
          },
        },
      },
    })

    vim.cmd("colorscheme nightfox")
    vim.api.nvim_set_hl(0, "SpellBad", {
      sp = "#666688",
      underdashed = true,
    })
    vim.api.nvim_set_hl(0, "SpellCap", {
      sp = "#444466",
      underdotted = true,
    })

    local undo_hl = vim.api.nvim_get_hl(0, { name = "HighlightUndo" })
    vim.api.nvim_set_hl(0, "HighlightUndo", { bg = undo_hl.bg })
  end,
}
