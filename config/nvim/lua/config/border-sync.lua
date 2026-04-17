local modes = {
  n = "lualine_a_normal",
  i = "lualine_a_insert",
  v = "lualine_a_visual",
  t = "lualine_a_terminal",
  V = "lualine_a_visual",
  [""] = "lualine_a_visual",
  c = "lualine_a_command",
  R = "lualine_a_replace",
}

local function hypr(args)
  local result = vim.fn.system(vim.list_extend({ "hyprctl" }, args))
  return result
end

local function get_mode_color()
  local mode = vim.fn.mode()
  local hl = modes[mode] or "lualine_a_normal"

  local ok, data = pcall(vim.api.nvim_get_hl, 0, { name = hl })
  if not ok or not data.bg then
    return
  end

  return string.format("rgba(%06xFF)", data.bg)
end

local function set_mode_border()
  local color = get_mode_color()
  if not color then
    return
  end

  hypr({
    "dispatch",
    "tagwindow",
    "+neovim",
  })
  hypr({
    "keyword",
    "windowrule[neovim-border-color]:border_color",
    color,
  })
end

local function restore_border()
  hypr({
    "dispatch",
    "tagwindow",
    "--",
    "-neovim",
  })
end

local function wait_for_hl(name, cb, retries)
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name })
  if ok and hl and hl.bg then
    cb()
    return
  end

  if retries <= 0 then
    return
  end

  vim.defer_fn(function()
    wait_for_hl(name, cb, retries - 1)
  end, 30)
end

local group = vim.api.nvim_create_augroup("HyprBorderSync", { clear = true })

vim.api.nvim_create_autocmd("UIEnter", {
  group = group,
  callback = function()
    wait_for_hl("lualine_a_normal", set_mode_border, 10)
  end,
})
vim.api.nvim_create_autocmd({ "ModeChanged", "FocusGained" }, {
  group = group,
  callback = set_mode_border,
})

vim.api.nvim_create_autocmd({ "FocusLost", "VimLeave" }, {
  group = group,
  callback = restore_border,
})
