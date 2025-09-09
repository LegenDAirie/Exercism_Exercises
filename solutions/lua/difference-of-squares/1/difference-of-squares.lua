local function sum(n, total)
  if n <= 0 then
    return total + 0
  else
      return sum(n - 1, total + n )
  end
end
local function square_of_sum(n)
  return sum(n, 0)^2
end

local function sum_of_squares_helper(n, total)
  if n < 1 then
    return total
  else
    return sum_of_squares_helper(n - 1, total + n^2)
  end
end
local function sum_of_squares(n)
  return sum_of_squares_helper(n, 0)
end

local function difference_of_squares(n)
  return square_of_sum(n) - sum_of_squares(n)
end

return { square_of_sum = square_of_sum, sum_of_squares = sum_of_squares, difference_of_squares = difference_of_squares }
