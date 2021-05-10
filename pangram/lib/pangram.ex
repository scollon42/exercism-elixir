defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @alphabet_list Map.new(Enum.map(?a..?z, fn l -> {<<l>>, 0} end))

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    sentence
    |> String.downcase()
    |> String.codepoints()
    |> Enum.reduce(@alphabet_list, fn letter, acc ->
      case Map.get(acc, letter) do
        0 -> Map.put(acc, letter, 1)
        _ -> acc
      end
    end)
    |> Enum.all?(fn {_k, v} -> v == 1 end)
  end
end
