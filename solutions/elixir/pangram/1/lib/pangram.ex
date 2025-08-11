defmodule Pangram do

  defguardp is_valid_sentence(sentence) when is_binary(sentence) and byte_size(sentence) >= 26
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) when is_valid_sentence(sentence) do
    if ( Enum.uniq( String.graphemes( String.replace( String.upcase(sentence), ~r/[^A-Z]/, "" ) ) ) |> length == 26 ), do: true, else: false
  end
  def pangram?(_sentence) do false end
end
