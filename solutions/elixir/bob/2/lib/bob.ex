defmodule Bob do
  def hey(input) do
    cond do
      String.upcase( input ) == input && String.upcase(input) != String.downcase(input) && String.last( input ) == "?" -> "Calm down, I know what I'm doing!"
      String.trim( input ) == "" -> "Fine. Be that way!"
      String.trim( input ) |> String.last == "?" -> "Sure."
      String.upcase( input ) == input && String.upcase(input) != String.downcase(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
