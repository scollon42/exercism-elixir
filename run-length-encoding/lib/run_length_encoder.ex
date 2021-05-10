defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """

  defmodule Acc do
    defstruct current: nil, accumulator: ""
  end

  @spec encode(String.t()) :: String.t()
  def encode(string) do
    encode(string, %Acc{})
  end

  defp encode("", %Acc{current: nil, accumulator: acc}), do: acc

  defp encode(<<first::binary-size(1)>> <> rest, %Acc{current: nil} = acc) do
    encode(rest, %{acc | current: {first, 1}})
  end

  defp encode(<<first::binary-size(1)>> <> rest, %Acc{current: {first, count}} = acc) do
    encode(rest, %{acc | current: {first, count + 1}})
  end

  defp encode(string, %Acc{current: {letter, count}} = acc) do
    encode(string, %Acc{
      accumulator:
        case count do
          1 ->
            acc.accumulator <> letter

          _ ->
            acc.accumulator <> "#{count}" <> letter
        end
    })
  end

  @spec decode(String.t()) :: String.t()
  def decode(""), do: ""

  def decode(string) do
    ~r/((\d+)([a-zA-Z ]))|([a-zA-Z ])/
    |> Regex.scan(string)
    |> Enum.map(&parse/1)
    |> Enum.join()
  end

  defp parse([_, "", "", "", letter]), do: letter

  defp parse([_, _, count, letter]) do
    count = String.to_integer(count)
    String.duplicate(letter, count)
  end
end
