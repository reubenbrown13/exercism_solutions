defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    rna_dict=%{?G => ?C, ?C => ?G, ?T => ?A, ?A => ?U}
    Enum.map(dna, fn(s) -> rna_dict[s] end)
  end
end
