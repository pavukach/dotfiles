-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+y$', { desc = "Copy till the end to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste from clipboard above cursor" })

local opts = { noremap = true, silent = true }
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)

vim.keymap.set("i", "<c-e>", function()
  local nldocs = require("noice.lsp.docs")
  local message = nldocs.get("signature")
  nldocs.hide(message)
end)

vim.keymap.set("n", "<leader>,", function()
  require("snacks").picker.buffers({
    sort_lastused = true,
  })
end, { desc = "Open buffers" })

vim.keymap.set("n", "<leader>as", function()
  vim.cmd("Neocodeium toggle")
  vim.cmd("Sidekick nes toggle")
end, { desc = "Toggle AI completion" })

if vim.g.neovide then
  vim.keymap.set("v", "<sc-c>", '"+y', { desc = "Copy to system clipboard" })
  vim.keymap.set("n", "<sc-v>", 'l"+P', { desc = "Paste from system clipboard" })
  vim.keymap.set("v", "<sc-v>", '"+P', { desc = "Paste from system clipboard" })
  vim.keymap.set("c", "<sc-v>", '<C-o>l<C-o>"+<C-o>P<C-o>l', { desc = "Paste from system clipboard" })
  vim.keymap.set("i", "<sc-v>", '<ESC>l"+Pli', { desc = "Paste from system clipboard" })
  vim.keymap.set("t", "<sc-v>", '<C-\\><C-n>"+Pi', { desc = "Paste from system clipboard" })
end
