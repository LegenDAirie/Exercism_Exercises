defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.upcase()
    |> String.graphemes()
    |> Enum.map(&letter_score/1)
    |> Enum.sum()
  end

  def letter_score(letter) do
    case letter do
      letter when letter in ~w(A E I O U L N R S T) -> 1
      letter when letter in ~w(D G) -> 2
      letter when letter in ~w(B C M P) -> 3
      letter when letter in ~w(F H V W Y) -> 4
      letter when letter in ~w(K) -> 5
      letter when letter in ~w(J X) -> 8
      letter when letter in ~w(Q Z) -> 10
      _ -> 0
    end
  end
end
