defmodule Scrabble do
  @scores [[1,"A","E","I","O","U","L","N","R","S","T"],[2,"D","G"],[3,"B","C","M","P"],[4,"F","H","V","W","Y"],[5,"K"],[8,"J","X"],[10,"Q","Z"]]
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score("") do
    0
  end
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    String.replace(String.upcase(word), ~r/\W/u, "")
    |> String.graphemes
    |> Enum.map( fn(char) -> hd( Enum.at(@scores, Enum.find_index(@scores , fn(x) -> Enum.member?( x, char ) end) ) ) end )
    |> Enum.sum
  end
end
