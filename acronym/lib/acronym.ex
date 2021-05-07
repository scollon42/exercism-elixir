defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """

  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split()
    |> Enum.map(&fetch_acronym/1)
    |> List.flatten()
    |> Enum.join()
    |> String.upcase()
  end

  @reg ~r/^[^A-Za-z]?(?<a>[A-Za-z])|[a-z-_]+(?<b>[A-Z])/

  defp fetch_acronym(word) do
    Regex.scan(@reg, word, capture: :all_names)
  end
end
