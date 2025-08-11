defmodule TwelveDays do
  @gifts %{0 => [pre: "On the ", str: " day of Christmas my true love gave to me: "],1 => [pre: "first", str: "a Partridge in a Pear Tree."],2 => [pre: "second", str: "two Turtle Doves, and "],3 => [pre: "third", str: "three French Hens, "],4 => [pre: "fourth", str: "four Calling Birds, "],5 => [pre: "fifth", str: "five Gold Rings, "],6 => [pre: "sixth", str: "six Geese-a-Laying, "],7 => [pre: "seventh", str: "seven Swans-a-Swimming, "],8 => [pre: "eighth", str: "eight Maids-a-Milking, "],9 => [pre: "ninth", str: "nine Ladies Dancing, "],10 => [pre: "tenth", str: "ten Lords-a-Leaping, "],11 => [pre: "eleventh", str: "eleven Pipers Piping, "],12 => [pre: "twelfth", str: "twelve Drummers Drumming, "] }
  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    result = (number..1) |> Enum.map( fn(x) -> ( @gifts[x][:str] ) end ) |> Enum.join
    @gifts[0][:pre]<>@gifts[number][:pre]<>@gifts[0][:str]<>result
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse\\1, ending_verse\\12) do
    (starting_verse..ending_verse) |> Enum.map( fn(x) -> verse(x)<>"\n" end) |> Enum.join |> String.slice(0..-2)
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
    verses()
  end
end
