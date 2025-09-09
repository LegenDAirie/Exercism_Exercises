defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    sentence
    |> String.replace([" ", "-"], "")
    |> String.graphemes()
    |> MapSet.new()
    |> MapSet.size()
    |> contains_same_amount_of_characters?(sentence)
  end

  def contains_same_amount_of_characters?(set_size, sentence) do
    sentence
    |> String.replace([" ", "-"], "")
    |> String.length()
    |> (fn sentence_length -> sentence_length == set_size end).()
  end
end
