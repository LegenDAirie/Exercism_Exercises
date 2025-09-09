local EliudsEggs = {}

function EliudsEggs.egg_count(number)
  local egg_count = 0
  while number > 0 do
    egg_count = egg_count + (number % 2)
    number = math.floor(number / 2)
  end

  return egg_count
end

return EliudsEggs
