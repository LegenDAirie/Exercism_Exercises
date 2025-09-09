defmodule MatchingBrackets do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    do_brackets_match?(str, [])
  end

  defp do_brackets_match?("", []), do: true
  defp do_brackets_match?("", _lingering_open_brackets), do: false

  defp do_brackets_match?(<<open_bracket::bytes-size(1)>> <> rest, open_brackets)
       when open_bracket in ~w<( [ {> do
    do_brackets_match?(rest, [open_bracket | open_brackets])
  end

  defp do_brackets_match?(<<close_bracket::bytes-size(1)>> <> rest, [open_bracket | open_brackets])
       when close_bracket in ~w<) ] }> do
    case does_open_bracket_match_close_bracket?(open_bracket, close_bracket) do
      true -> do_brackets_match?(rest, open_brackets)
      false -> false
    end
  end

  defp do_brackets_match?(<<non_bracket_char::bytes-size(1)>> <> rest, open_brackets) do
    do_brackets_match?(rest, open_brackets)
  end

  defp does_open_bracket_match_close_bracket?(open_bracket, close_bracket) do
    case {open_bracket, close_bracket} do
      {"[", "]"} -> true
      {"{", "}"} -> true
      {"(", ")"} -> true
      _ -> false
    end
  end
end
