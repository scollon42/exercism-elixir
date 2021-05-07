defmodule SecretHandshake do
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

  use Bitwise

  @commands [
    {0b00001, "wink"},
    {0b00010, "double blink"},
    {0b00100, "close your eyes"},
    {0b01000, "jump"}
  ]

  @reverse 0b10000

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    list =
      @commands
      |> Enum.reduce([], &(compile_command(code, &1, &2)))

    reverse = code &&& @reverse

    if reverse != 0, do: Enum.reverse(list), else: list
  end

  defp compile_command(code, {c, command}, acc) do
    case code &&& c do
      0 ->
        acc

      _ ->
        acc ++ [command]
    end
  end
end
