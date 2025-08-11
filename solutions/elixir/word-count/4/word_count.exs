defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase() # lower case the string.
    |> String.split( ~r/[^[:alnum:]-]/u, trim: true ) # split the string by any non letter/number.
    |> Enum.reduce( %{}, fn word, acc -> Map.put( acc, word, ( acc[word] || 0) + 1) end) # create the map of the words with the count for each instance.
    end
end
