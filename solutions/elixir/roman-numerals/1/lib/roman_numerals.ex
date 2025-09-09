defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    roman_numeral(number, "")
  end

  defp roman_numeral(number, roman_num) when number == 0, do: roman_num

  defp roman_numeral(number, roman_num) when number >= 1000,
    do: roman_numeral(number - 1000, roman_num <> "M")

  defp roman_numeral(number, roman_num) when number >= 900,
    do: roman_numeral(number - 900, roman_num <> "CM")

  defp roman_numeral(number, roman_num) when number >= 500,
    do: roman_numeral(number - 500, roman_num <> "D")

  defp roman_numeral(number, roman_num) when number >= 400,
    do: roman_numeral(number - 400, roman_num <> "CD")

  defp roman_numeral(number, roman_num) when number >= 100,
    do: roman_numeral(number - 100, roman_num <> "C")

  defp roman_numeral(number, roman_num) when number >= 90,
    do: roman_numeral(number - 90, roman_num <> "XC")

  defp roman_numeral(number, roman_num) when number >= 50,
    do: roman_numeral(number - 50, roman_num <> "L")

  defp roman_numeral(number, roman_num) when number >= 40,
    do: roman_numeral(number - 40, roman_num <> "XL")

  defp roman_numeral(number, roman_num) when number >= 10,
    do: roman_numeral(number - 10, roman_num <> "X")

  defp roman_numeral(number, roman_num) when number >= 9,
    do: roman_numeral(number - 9, roman_num <> "IX")

  defp roman_numeral(number, roman_num) when number >= 5,
    do: roman_numeral(number - 5, roman_num <> "V")

  defp roman_numeral(number, roman_num) when number >= 4,
    do: roman_numeral(number - 4, roman_num <> "IV")

  defp roman_numeral(number, roman_num) when number >= 1,
    do: roman_numeral(number - 1, roman_num <> "I")
end
