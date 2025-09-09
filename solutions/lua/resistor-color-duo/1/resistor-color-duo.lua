return {
  value = function(colors)
    local bands = {
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
    local bandOne = bands[colors[1]]
    local bandTwo = bands[colors[2]]
    return (bandOne * 10) + bandTwo
  end
}
