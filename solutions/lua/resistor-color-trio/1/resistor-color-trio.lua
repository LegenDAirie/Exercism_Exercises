local convertOhms = function(ohms)
  local prefix = {'', 'kilo', 'mega', 'giga'}
  local index = 1
  while ohms > 0 and ohms % 1000 == 0 do
    ohms = ohms / 1000
    index = index + 1
  end
  return ohms, prefix[index] .. 'ohms'
end
local decode = function(c1, c2, c3)
    local resistances = {
      black = 0,
      brown = 1,
      red = 2,
      orange = 3,
      yellow = 4,
      green = 5,
      blue = 6,
      violet = 7,
      grey = 8,
      white = 9
    }
    
    local ohms = ((resistances[c1] * 10) + resistances[c2]) * 10^resistances[c3]
    return convertOhms(ohms)
end



return {
  decode = decode
}