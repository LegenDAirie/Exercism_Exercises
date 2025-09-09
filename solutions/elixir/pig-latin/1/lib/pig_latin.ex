defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    String.split(phrase)
    |> Enum.map(&translate_word/1)
    |> Enum.join(" ")
  end

  defp translate_word(word) do
    move_consonants(word) <> "ay"
  end

  @vowels 'aeiou'
  defp move_consonants(word) do
    case word do
      # x/y plus a consonant is counted as a vowel
      <<"x", char>> <> _ when char not in @vowels -> word
      <<"y", char>> <> _ when char not in @vowels -> word
      <<vowel>> <> _ when vowel in @vowels -> word

      # "qu" counts as one consonant
      "qu" <> rest -> move_consonants(rest <> "qu")
      <<consonant>> <> rest -> move_consonants(rest <> <<consonant>>)
    end
  end
end
