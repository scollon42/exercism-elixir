defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, 26), do: text

  def rotate(text, shift) do
    text
    |> String.replace(
      ~r/[a-zA-Z]/,
      fn <<char>> ->
        <<rot(char, shift)>>
      end)
  end

  def rot(code, shift) when code + shift > ?z do
    code + shift - 26
  end

  def rot(code, shift) when code < ?Z and code + shift > ?Z do
    code + shift - 26
  end

  def rot(code, shift) do
    code + shift
  end
end
