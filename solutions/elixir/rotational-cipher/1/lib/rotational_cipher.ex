defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    String.to_charlist(text)
    |> Enum.map(&shiftLetter(&1, shift))
    |> List.to_string()
  end

  defp shiftLetter(char, shiftBy) when char in ?a..?z, do: rem(char - ?a + shiftBy, 26) + ?a
  defp shiftLetter(char, shiftBy) when char in ?A..?Z, do: rem(char - ?A + shiftBy, 26) + ?A
  defp shiftLetter(char, _), do: char
end
