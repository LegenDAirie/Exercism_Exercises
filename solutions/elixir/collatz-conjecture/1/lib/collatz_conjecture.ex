defmodule CollatzConjecture do
  defguard is_even(value) when is_integer(value) and rem(value, 2) == 0
  defguard is_odd(value) when is_integer(value) and rem(value, 2) !== 0

  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when input > 0 do
    calculate(input, 0)
  end

  defp calculate(1, steps), do: steps
  defp calculate(number, steps) when is_even(number), do: calculate(div(number, 2), steps + 1)
  defp calculate(number, steps) when is_odd(number), do: calculate(number * 3 + 1, steps + 1)
end
