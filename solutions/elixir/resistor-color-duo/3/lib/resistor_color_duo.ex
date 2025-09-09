defmodule ResistorColorDuo do
  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value([first_band, second_band | _rest]) do
    get_resistance(first_band) * 10 + get_resistance(second_band)
  end

  defp get_resistance(color) do
    cond do
      color == :black -> 0
      color == :brown -> 1
      color == :red -> 2
      color == :orange -> 3
      color == :yellow -> 4
      color == :green -> 5
      color == :blue -> 6
      color == :violet -> 7
      color == :grey -> 8
      color == :white -> 9
      true -> 0
    end
  end
end
