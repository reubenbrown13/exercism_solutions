defmodule Bob do
  def hey(input) do
    cond do
      String.upcase( input ) == input && Regex.run( ~r/[A-Za-z]/u, input ) && String.last( input ) == "?" -> "Calm down, I know what I'm doing!"
      String.trim( input ) == "" -> "Fine. Be that way!"
      String.trim( input ) |> String.last == "?" -> "Sure."
      String.upcase( input ) == input && Regex.run( ~r/\p{L}/u, input ) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
