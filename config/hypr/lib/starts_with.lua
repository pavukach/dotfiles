local function starts_with(str, start)
  return string.sub(str, 1, #start) == start
end

return starts_with
