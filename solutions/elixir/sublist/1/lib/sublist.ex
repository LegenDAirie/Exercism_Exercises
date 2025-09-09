defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when a == b, do: :equal

  def compare(a, b) do
    cond do
      sublist?(b, a) -> :sublist
      sublist?(a, b) -> :superlist
      true -> :unequal
    end
  end

  defp sublist?([], _), do: false

  defp sublist?(list_a = [_ | rest_a], list_b) do
    List.starts_with?(list_a, list_b) or sublist?(rest_a, list_b)
  end
end
