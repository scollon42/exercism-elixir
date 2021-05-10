defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.downcase()
    |> String.codepoints()
    |> Enum.reduce(0, &compute_score/2)
  end

  defp compute_score(letter, score) when letter in ~w(a e i o u l n r s t), do: score + 1
  defp compute_score(letter, score) when letter in ~w(d g), do: score + 2
  defp compute_score(letter, score) when letter in ~w(b c m p), do: score + 3
  defp compute_score(letter, score) when letter in ~w(f h v w y), do: score + 4
  defp compute_score(letter, score) when letter in ~w(k), do: score + 5
  defp compute_score(letter, score) when letter in ~w(j x), do: score + 8
  defp compute_score(letter, score) when letter in ~w(q z), do: score + 10
  defp compute_score(_letter, score), do: score
end
