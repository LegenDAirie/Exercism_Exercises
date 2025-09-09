defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    Range.new(1, limit - 1)
    |> Enum.filter(&is_factor(&1, factors))
    |> Enum.sum()
  end

  def is_factor(number, factors) do
    Enum.any?(factors, fn factor -> rem(number, factor) == 0 end)
  end
end
