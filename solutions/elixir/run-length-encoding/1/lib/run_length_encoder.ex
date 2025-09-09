defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    string
    |> String.graphemes()
    |> Enum.chunk_by(&Function.identity/1)
    |> Enum.map(&compress/1)
    |> Enum.join()
  end

  defp compress([letter]), do: letter

  defp compress(letters) do
    to_string(Enum.count(letters)) <> List.first(letters)
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    string
    |> String.split(~r/(\d*)[[:alpha:]]/, include_captures: true, trim: true)
    |> Enum.map(&decompress/1)
    |> Enum.join()
  end

  def decompress(<<letter::utf8>>), do: <<letter>>

  def decompress(compressed_letters) do
    letter = String.last(compressed_letters)

    number_of_letters =
      String.trim_trailing(compressed_letters, letter)
      |> String.to_integer()

    String.duplicate(letter, number_of_letters)
  end
end
