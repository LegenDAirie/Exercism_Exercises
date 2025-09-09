defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @words ~r/[^[:alpha:]']|[a-z](?=[A-Z])/
  # [^[:alpha:]'] match non-alphebit characters including single quote character
  # [a-z](?=[A-Z]) match a lowercase letter directly before an uppercase letter↓
  # we want to split up camel cased words
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(sentence) do
    sentence
    |> String.split(@words)
    |> Enum.map(&String.first/1)
    |> Enum.join
    |> String.upcase
  end
end
