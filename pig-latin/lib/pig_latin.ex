defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """

  @vowels ~w(a e i o u)s

  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> Enum.map(&translate_word/1)
    |> Enum.join(" ")
  end

  def translate_word("squ" <> rest) do
    rest <> "squay"
  end

  def translate_word("qu" <> rest) do
    rest <> "quay"
  end

  def translate_word(<<first::binary-size(1)>> <> <<follow::binary-size(1)>> <> _rest = word)
      when first in ~w(y x)s and follow not in @vowels do
    word <> "ay"
  end

  def translate_word(word) do
    char_list = String.codepoints(word)

    start =
      char_list
      |> Enum.take_while(&(&1 not in @vowels))
      |> Enum.join()

    rest =
      char_list
      |> Enum.drop(String.length(start))
      |> Enum.join()

    rest <> start <> "ay"
  end
end
