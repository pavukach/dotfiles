local function index_of(arr, el)
  for i, v in pairs(arr) do
    if v == el then
      return i
    end
  end
  return false
end

return index_of
