defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    |> Enum.reduce('', &to_rna/2)
  end

  defp to_rna(?G, acc), do: acc ++ 'C'

  defp to_rna(?C, acc), do: acc ++ 'G'

  defp to_rna(?A, acc), do: acc ++ 'U'

  defp to_rna(?T, acc), do: acc ++ 'A'

  defp to_rna(_, acc), do: acc
end
