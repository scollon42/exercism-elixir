defmodule TwelveDays do
  @moduledoc false

  @gifts [
    "a Partridge in a Pear Tree",
    "two Turtle Doves",
    "three French Hens",
    "four Calling Birds",
    "five Gold Rings",
    "six Geese-a-Laying",
    "seven Swans-a-Swimming",
    "eight Maids-a-Milking",
    "nine Ladies Dancing",
    "ten Lords-a-Leaping",
    "eleven Pipers Piping",
    "twelve Drummers Drumming"
  ]

  @days ~w[
    first
    second
    third
    fourth
    fifth
    sixth
    seventh
    eighth
    ninth
    tenth
    eleventh
    twelfth
  ]

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) when number < 1 and number > 12, do: ""

  def verse(number) do
    gifts =
      number..1
      |> Enum.map(&Enum.at(@gifts, &1 - 1))
      |> join_gifts("")

    day = Enum.at(@days, number - 1)

    "On the #{day} day of Christmas my true love gave to me: #{gifts}."
  end

  defp join_gifts([last], acc) do
    acc <> last
  end

  defp join_gifts([head, tail], acc) do
    join_gifts([tail], acc <> head <> ", and ")
  end

  defp join_gifts([head | tail], acc) do
    join_gifts(tail, acc <> head <> ", ")
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    starting_verse..ending_verse
    |> Enum.map(&verse/1)
    |> Enum.join("\n")
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
    verses(1, 12)
  end
end
