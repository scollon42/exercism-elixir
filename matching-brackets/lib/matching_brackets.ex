defmodule MatchingBrackets do
  @opening ["{", "(", "["]
  @closing ["}", ")", "]"]

  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    is_valid?(str, [])
  end

  defp is_valid?("", []), do: true
  defp is_valid?("", _), do: false

  defp is_valid?(<<c::binary-size(1)>> <> _, []) when c in @closing, do: false

  defp is_valid?(<<c::binary-size(1)>> <> str, stack) when c in @opening do
    is_valid?(str, [c | stack])
  end

  defp is_valid?(<<c::binary-size(1)>> <> str, [last | stack]) when c in @closing do
    cond do
      matching?(c, last) -> is_valid?(str, stack)
      true -> false
    end
  end

  defp is_valid?(<<_c::binary-size(1)>> <> str, stack) do
    is_valid?(str, stack)
  end

  defp matching?("}", "{"), do: true
  defp matching?(")", "("), do: true
  defp matching?("]", "["), do: true
  defp matching?(_, _), do: false
end
