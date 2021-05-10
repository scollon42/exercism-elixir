defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """

  @romans %{
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M"
  }

  @iterations Map.keys(@romans) |> Enum.reverse()

  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    number
    |> reduce_number(@iterations, [])
    |> Enum.join()
  end

  defp reduce_number(0, _iteration, list), do: list

  defp reduce_number(number, [iteration | _rest] = iterations, list) when number >= iteration do
    value = Map.get(@romans, iteration)

    reduce_number(number - iteration, iterations, list ++ [value])
  end

  defp reduce_number(number, [_iteration | rest], list) do
    reduce_number(number, rest, list)
  end
end
