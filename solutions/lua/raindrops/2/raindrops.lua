local raindrops = {
  [3] = 'Pling',
  [5] = 'Plang',
  [7] = 'Plong',
}
local keys = {}
for key in pairs(raindrops) do
  table.insert(keys, key)
end
table.sort(keys)

return function(n)
  local result = ''
  for _, key in ipairs(keys) do
    if n % key == 0 then
      result = result..raindrops[key]
    end
  end
  if result == '' then 
    return tostring(n)
  end
  return result
end