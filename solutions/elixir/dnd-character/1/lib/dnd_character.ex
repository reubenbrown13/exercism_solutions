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
    floor((score - 10)/2)
  end

  @spec ability :: pos_integer()
  def ability do
    #Enum.random(3..18)
    Enum.map( [1,2,3,4], fn(_x) -> Enum.random(1..6) end ) |> Enum.sort() |> tl() |> Enum.sum()
    # Need to change to do 4 random values of 1..6 and drop the lowest and then sum the rest.
    #Enum.map(@defstruct, fn() -> Enum.random(3..18) end)
  end

  @spec character :: t()
  def character do
    character = %DndCharacter{
      strength: ability(),
      dexterity: ability(),
      constitution: ability(),
      intelligence: ability(),
      wisdom: ability(),
      charisma: ability()
    }
    Map.put(character, :hitpoints, 10+modifier(character.constitution))
    #%{:strength => ability()}
    #Enum.each( List.delete( Map.keys(character), :__struct__ ), fn(key,acc) -> Map.put( acc, key, ability() ) end)
  end
end
