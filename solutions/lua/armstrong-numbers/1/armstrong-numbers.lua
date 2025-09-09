local ArmstrongNumbers = {}

function ArmstrongNumbers.is_armstrong_number(number)
  local numberStr = tostring(number)
  local exponent = string.len(numberStr)
  local sum = 0

  for i = 1, #numberStr do
    local digit = numberStr:sub(i, i)
    sum = sum + digit ^ exponent
  end
  return number == sum
end

return ArmstrongNumbers
