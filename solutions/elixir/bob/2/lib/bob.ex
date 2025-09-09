defmodule Bob do
  def hey(input) do
    cond do
      saying_nothing?(input)-> "Fine. Be that way!"
      forceful_question?(input) -> "Calm down, I know what I'm doing!"
      yelling?(input) -> "Whoa, chill out!"
      question?(input) -> "Sure."
      true -> "Whatever."
    end
  end

  defp yelling?(sentence) do
    has_letters?(sentence) and String.upcase(sentence) == sentence
  end

  defp has_letters?(sentence) do Regex.match?(~r/[[:alpha:]]/u, sentence) end

  defp question?(sentence) do
    sentence
    |> String.trim()
    |> String.ends_with?("?")
  end

  defp forceful_question?(sentence) do
    has_letters?(sentence) and yelling?(sentence) and question?(sentence)
  end

  defp saying_nothing?(sentence) do
    sentence
    |> String.trim()
    |> (&(&1 == "")).()
  end
end
