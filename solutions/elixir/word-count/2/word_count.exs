defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    # this passes all the tests except the german one.  The string there keeps getting turned into a binary list and i cannot figure out how to make it stop.
    str = String.replace( String.downcase( sentence ), ~r/[_]/, " ") # replace _ with spaces.
    str = String.replace( str, ~r/[^\w -]/u, "") # remove all non letter characters, but preserve spaces and dashes.
    str = Enum.map( String.split(  str , " ", trim: true ), fn x -> if String.length(x) >0, do: x end)  # split the wordds by using the space as a delimiter.
    str |> Enum.reduce( %{}, fn word, acc -> Map.put( acc, word, ( acc[word] || 0) + 1) end) # create the map of the words with the count for each instance.
    end
end
