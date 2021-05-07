defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split(~r/[^[:alnum:]-]/u, trim: true)
    |> Enum.reduce(%{}, fn word, acc ->
      case Map.get(acc, word) do
        nil ->
          Map.put(acc, word, 1)

        count ->
          Map.put(acc, word, count + 1)
      end
    end)
  end
end
