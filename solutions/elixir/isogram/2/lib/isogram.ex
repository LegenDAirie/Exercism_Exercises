defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    sentence
    |> String.replace([" ", "-"], "")
    |> is_isogram?()
  end

  defp is_isogram?(sentence) do
    sentence
    |> String.graphemes()
    |> MapSet.new()
    |> MapSet.size() == String.length(sentence)
  end
end
