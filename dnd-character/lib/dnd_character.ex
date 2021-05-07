defmodule DndCharacter do
  @type t :: %__MODULE__{
          strength: pos_integer(),
          dexterity: pos_integer(),
          constitution: pos_integer(),
          intelligence: pos_integer(),
          wisdom: pos_integer(),
          charisma: pos_integer(),
          hitpoints: pos_integer()
        }

  defstruct ~w[strength dexterity constitution intelligence wisdom charisma hitpoints]a

  @spec modifier(pos_integer()) :: integer()
  def modifier(score) do
    Integer.floor_div(score - 10, 2)
  end

  @spec ability :: pos_integer()
  def ability do
    1..4
    |> Enum.map(fn _i ->
      :rand.uniform(6)
    end)
    |> Enum.sort()
    |> Enum.drop(1)
    |> Enum.sum()
  end

  @spec character :: t()
  def character do
    ~w(strength dexterity constitution intelligence wisdom charisma)a
    |> Enum.reduce(%DndCharacter{}, &build_abilities/2)
  end

  defp build_abilities(:constitution, %DndCharacter{} = char) do
    consitution = ability()

    %{
      char
      | constitution: consitution,
        hitpoints: 10 + modifier(consitution)
    }
  end

  defp build_abilities(ability, %DndCharacter{} = char) do
    Map.put(char, ability, ability())
  end
end
