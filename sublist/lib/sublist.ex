defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(list, list), do: :equal

  def compare(list_a, list_b) when length(list_a) <= length(list_b) do
    cond do
      is_subset_of?(list_a, list_b) -> :sublist
      true -> :unequal
    end
  end

  def compare(list_a, list_b) do
    cond do
      is_subset_of?(list_b, list_a) -> :superlist
      true -> :unequal
    end
  end

  defp is_subset_of?([], _), do: true

  defp is_subset_of?(a, b) do
    Stream.chunk_every(b, length(a), 1, :discard)
    |> Enum.any?(&(&1 === a))
  end
end
