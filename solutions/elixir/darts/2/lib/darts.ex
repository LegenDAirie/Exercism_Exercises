import :math

defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score(position) do
    distance = calc_distance(position)
    cond do
      distance > 10 -> 0
      distance > 5 -> 1
      distance > 1 -> 5
      true -> 10
    end
  end

  def calc_distance({x, y}) do
    :math.sqrt(x*x + y*y)
  end
end