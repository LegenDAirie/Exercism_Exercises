defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """


  @unwanted_characters ~r/[^\w-]|_/u
  # [^\w] Match a single character not present in [a-zA-Z0-9_]
  # - in the brackets will match on hyphens
  # |_ Also matches an underscore
  # u at the end includes characters that are greater than a codepoint of 127

  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.split(@unwanted_characters, trim: true)
    |> List.foldl(%{}, &count_word/2)
  end

  defp count_word(word, word_count) do
    Map.update(word_count, word, 1, &(&1 + 1))
  end
end
