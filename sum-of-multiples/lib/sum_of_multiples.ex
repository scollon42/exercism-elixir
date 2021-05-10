defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    1..(limit - 1)
    |> Enum.reduce(0, fn n, sum ->
      cond do
        Enum.any?(factors, &(rem(n, &1) == 0)) -> sum + n
        true -> sum
      end
    end)
  end
end
