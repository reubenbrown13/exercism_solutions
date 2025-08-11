defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    Enum.uniq( String.graphemes( String.replace( String.upcase(sentence), ~r/[^A-Z]/, "" ) ) ) == String.graphemes( String.replace( String.upcase(sentence), ~r/[^A-Z]/, "" ) )
  end
end
