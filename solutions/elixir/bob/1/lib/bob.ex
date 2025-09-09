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

  def yelling?(sentence) do
    sentence
    |> String.split(~r/[^[:alpha:]]|/u, [include_captures: false, trim: true])
    |> all_caps?()
  end

  def all_caps?(letters) do
    case letters do
      [] -> false
      _ -> Enum.all?(letters, fn letter -> Regex.match?(~r/[[:upper:]]/, letter) end)
    end
  end

  def question?(sentence) do
    sentence
    |> String.trim()
    |> String.at(-1) == "?"
  end

  def forceful_question?(sentece) do
    yelling?(sentece) and question?(sentece)
  end

  def saying_nothing?(sentence) do
    sentence
    |> String.replace(["\n", "\r", "\t", " "], "")
    |> (&(&1 == "")).()
  end
end
