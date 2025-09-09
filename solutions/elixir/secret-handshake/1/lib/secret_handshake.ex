defmodule SecretHandshake do
  use Bitwise, only_operators: true
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    handShake([], code &&& 0b00001)
      |> handShake(code &&& 0b00010)
      |> handShake(code &&& 0b00100)
      |> handShake(code &&& 0b01000)
      |> handShake(code &&& 0b10000)
  end

  def handShake(steps, 0b00001) do steps ++ ["wink"] end
  def handShake(steps, 0b00010) do steps ++ ["double blink"] end
  def handShake(steps, 0b00100) do steps ++ ["close your eyes"] end
  def handShake(steps, 0b01000) do steps ++ ["jump"] end
  def handShake(steps, 0b10000) do Enum.reverse(steps) end
  def handShake(steps, _) do steps end
end
