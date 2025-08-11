defmodule MatchingBrackets do
  @brackets %{"]"=>"[","}"=>"{",")"=>"("}
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) when byte_size(str) == 0 do true end
  def check_brackets(str) do
    # use regex to clear out all non-bracket chars in list.
    String.replace( str, ~r/[^\(\)\[\]\{\}]/u, "" ) |> String.graphemes
    |> Enum.reduce_while( ["0"], fn(ch, acc) ->
      if ( ch in Map.values(@brackets) ), do: {:cont,[ch|acc]}, else: if ( Enum.count(acc) > 1 and Map.fetch!(@brackets, ch) == hd(acc) ), do: {:cont,tl(acc)}, else: {:halt,[ch|acc]}
    end ) |> to_string()
    |> String.equivalent?( "0" )
  end
end
