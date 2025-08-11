defmodule NucleotideCount do
  @nucleotides [?A, ?T, ?C, ?G]
  @nucleotideHistograrm %{ ?A => 0, ?T => 0, ?C => 0, ?G => 0 }
  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    histogram(strand)[nucleotide]
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    strand |> Enum.reduce(@nucleotideHistograrm, fn char, acc ->
              Map.put( acc, char, ( acc[char] || 0 ) + 1 )
              end)
  end
end
