defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label([first, second, magnitude | _]) do
    digits(first, second)
      |> apply_magnitude(magnitude)
      |> with_units()
  end

  defp digits(band_one, band_two), do: 10 * digit(band_one) + digit(band_two)

  defp apply_magnitude(ohms, magnitude), do: ohms * 10 ** digit(magnitude)

  defp digit(:black), do: 0
  defp digit(:brown), do: 1
  defp digit(:red), do: 2
  defp digit(:orange), do: 3
  defp digit(:yellow), do: 4
  defp digit(:green), do: 5
  defp digit(:blue), do: 6
  defp digit(:violet), do: 7
  defp digit(:grey), do: 8
  defp digit(:white), do: 9

  defp with_units(ohms) when ohms < 1_000, do: {ohms, :ohms}
  defp with_units(ohms) when ohms < 1_000_000,  do: {ohms / 1_000, :kiloohms}
  defp with_units(ohms) when ohms < 1_000_000_000, do: {ohms / 1_000_000, :megaohms}
  defp with_units(ohms), do: {ohms / 1_000_000_000, :gigaohms}
end
