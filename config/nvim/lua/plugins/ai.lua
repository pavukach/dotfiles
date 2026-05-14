return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  opts = {
    filetypes = {
      TelescopePrompt = false,
      ["dap-repl"] = false,
      snacks_picker_input = false,
      text = false,
      markdown = false,
    },
  },
  keys = {
    { mode = { "i" }, "<A-f>", function() require("neocodeium").accept() end, { desc = "Accept completion" } },
    { mode = { "i" }, "<A-w>", function() require("neocodeium").accept_word() end, { desc = "Accept word" } },
    { mode = { "i" }, "<A-a>", function() require("neocodeium").accept_line() end, { desc = "Accept line" } },
    { mode = { "i" }, "<A-e>", function() require("neocodeium").cycle_or_complete() end, { desc = "Cycle next" } },
    { mode = { "i" }, "<A-r>", function() require("neocodeium").cycle_or_complete(-1) end, { desc = "Cycle prev" } },
    { mode = { "i" }, "<A-c>", function() require("neocodeium").clear() end, { desc = "Clear completion" } },

    { mode = { "i" }, "<A-а>", function() require("neocodeium").accept() end, { desc = "Accept completion" } },
    { mode = { "i" }, "<A-ц>", function() require("neocodeium").accept_word() end, { desc = "Accept word" } },
    { mode = { "i" }, "<A-ф>", function() require("neocodeium").accept_line() end, { desc = "Accept line" } },
    { mode = { "i" }, "<A-у>", function() require("neocodeium").cycle_or_complete() end, { desc = "Cycle next" } },
    { mode = { "i" }, "<A-к>", function() require("neocodeium").cycle_or_complete(-1) end, { desc = "Cycle prev" } },
    { mode = { "i" }, "<A-с>", function() require("neocodeium").clear() end, { desc = "Clear completion" } },
  },
}
