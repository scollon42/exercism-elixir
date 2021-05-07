defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(string :: String.t(), size :: integer) :: list(String.t())
  def slices(_string, size) when size < 1, do: []

  def slices(string, size) do
    string
    |> String.codepoints()
    |> Enum.chunk_every(size, 1, :discard)
    |> Enum.map(&Enum.join/1)
  end
end
