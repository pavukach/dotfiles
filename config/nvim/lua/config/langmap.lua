local function escape(str)
  local escape_chars = [[;,."|\]]
  return vim.fn.escape(str, escape_chars)
end

local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ua = [['йцукенгшщзхїфівапролджєячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ua_shift = [[ʼЙЦУКЕНГШЩЗХЇФІВАПРОЛДЖЄЯЧСМИТЬБЮ]]

vim.opt.langmap = vim.fn.join({
  escape(ua_shift) .. ";" .. escape(en_shift),
  escape(ua) .. ";" .. escape(en),
}, ",")
