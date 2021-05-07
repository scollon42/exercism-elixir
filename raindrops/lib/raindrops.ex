defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    res =
      1..number
      |> Enum.reduce("", fn f, acc ->
        case rem(number, f) do
          0 ->
            append_drops(f, acc)

          _ ->
            acc
        end
      end)

    case String.length(res) do
      0 -> Integer.to_string(number)
      _ -> res
    end
  end

  defp append_drops(3, acc), do: acc <> "Pling"
  defp append_drops(5, acc), do: acc <> "Plang"
  defp append_drops(7, acc), do: acc <> "Plong"
  defp append_drops(_, acc), do: acc
end
