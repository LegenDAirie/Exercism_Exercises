local Darts = {}

function Darts.score(x, y)
  local distance = math.sqrt(x^2 + y^2)
  local score = 0

  if distance > 10 then
    score = 0
  elseif distance > 5 then
    score = 1
  elseif distance > 1 then
    score = 5
  else
    score = 10
  end

  return score
end

return Darts
