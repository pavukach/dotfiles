-- Disable auto commenting
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("formatoptions", { clear = true }),
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})

local numbertoggle = vim.api.nvim_create_augroup("numbertoggle", { clear = true })

-- Disable numbers for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = numbertoggle,
  pattern = { "alpha", "dashboard", "toggleterm", "help", "qf" },
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter", "CmdlineLeave", "TermLeave" }, {
  group = numbertoggle,
  callback = function()
    if vim.opt.number:get() and vim.api.nvim_get_mode() ~= "i" then
      vim.opt.relativenumber = true
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave", "CmdlineEnter" }, {
  group = numbertoggle,
  callback = function()
    if vim.opt.number:get() then
      vim.opt.relativenumber = false
      vim.cmd("redraw")
    end
  end,
})

-- terminal setup
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("terminal", { clear = true }),
  callback = function()
    vim.keymap.set("t", "<esc><esc>", [[<C-\><C-n>]], { buffer = true }) -- exit mapping
    vim.opt_local.spell = false -- no spell checking
    vim.opt_local.syntax = "OFF" -- no syntax parsing
  end,
})
