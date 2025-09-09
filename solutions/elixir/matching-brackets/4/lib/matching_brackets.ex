defmodule MatchingBrackets do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    brackets_match?(str, [])
  end

  defp brackets_match?("", []), do: true
  defp brackets_match?("", _lingering_open_brackets), do: false

  defp brackets_match?("{" <> rest, acc), do: brackets_match?(rest, ["{" | acc])
  defp brackets_match?("[" <> rest, acc), do: brackets_match?(rest, ["[" | acc])
  defp brackets_match?("(" <> rest, acc), do: brackets_match?(rest, ["(" | acc])

  defp brackets_match?("}" <> rest, ["{" | tail]), do: brackets_match?(rest, tail)
  defp brackets_match?("]" <> rest, ["[" | tail]), do: brackets_match?(rest, tail)
  defp brackets_match?(")" <> rest, ["(" | tail]), do: brackets_match?(rest, tail)

  defp brackets_match?("}" <> rest, [_ | tail]), do: false
  defp brackets_match?("]" <> rest, [_ | tail]), do: false
  defp brackets_match?(")" <> rest, [_ | tail]), do: false

  defp brackets_match?(<<_, rest::binary>>, acc), do: brackets_match?(rest, acc)
end
