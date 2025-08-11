defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase() # lower case the string.
    |> String.replace( ~r/[^\w -]/u, "") # remove all non letter characters, but preserve spaces and dashes.
    |> String.split( ~r/[ _]/, trim: true ) # split the string by either spaces or underscore.
    |> Enum.map( fn x -> if String.length(x) >0, do: x end)  # split the wordds by using the space as a delimiter.
    |> Enum.reduce( %{}, fn word, acc -> Map.put( acc, word, ( acc[word] || 0) + 1) end) # create the map of the words with the count for each instance.
    end
end
