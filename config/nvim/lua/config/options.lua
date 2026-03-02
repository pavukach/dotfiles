vim.opt.clipboard = ""
vim.opt.timeoutlen = 1000

vim.opt.spell = true
vim.opt.spelllang = { "en", "uk" }

vim.opt.number = true
vim.o.winborder = "rounded"

require("config.cursor")
require("config.langmap")
require("config.neovide")
