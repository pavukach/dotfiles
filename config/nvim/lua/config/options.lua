vim.opt.clipboard = ""
vim.opt.timeoutlen = 1000

vim.opt.spell = true
vim.opt.spelllang = { "en", "uk" }

vim.opt.number = true
vim.o.winborder = "rounded"

vim.g.root_spec = { "cwd" }

require("config.cursor")
require("config.langmap")
require("config.neovide")
