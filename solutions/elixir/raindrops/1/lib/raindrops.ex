defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    factor_3(number) <> factor_5(number) <> factor_7(number) <> factor_none(number)
  end

  def factor_3(number) when rem(number, 3) == 0, do: "Pling"
  def factor_3(_number), do: ""

  def factor_5(number) when rem(number, 5) == 0, do: "Plang"
  def factor_5(_number), do: ""

  def factor_7(number) when rem(number, 7) == 0, do: "Plong"
  def factor_7(_number), do: ""

  def factor_none(number)
      when rem(number, 3) == 0 or
             rem(number, 5) == 0 or
             rem(number, 7) == 0,
      do: ""

  def factor_none(number), do: to_string(number)
end
