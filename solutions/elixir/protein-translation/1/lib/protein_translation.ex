defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @rnaDict %{UGU: "Cysteine",UGC: "Cysteine",UUA: "Leucine",UUG: "Leucine",AUG: "Methionine",UUU: "Phenylalanine",UUC: "Phenylalanine",UCU: "Serine",UCC: "Serine",UCA: "Serine",UCG: "Serine",UGG: "Tryptophan",UAU: "Tyrosine",UAC: "Tyrosine",UAA: "STOP",UAG: "STOP",UGA: "STOP"}
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    rna |> String.codepoints |> Enum.chunk_every(3) |> Enum.map(&Enum.join/1)
    |> Enum.take_while( fn(codon) ->
      case of_codon(codon) do
        {:error, _} -> true
        {:ok, "STOP"} -> false
        {:ok, _protein} -> true
      end
    end ) |> Enum.map( fn(codon) -> if elem(of_codon(codon), 0) == :error, do: "", else: elem(of_codon(codon), 1) end )
    |> (&( if Enum.member?(&1, "") , do: {:error, "invalid RNA"}, else: {:ok, &1} )).()
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serineinteger
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine{:
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    case Access.fetch(@rnaDict, String.to_atom(codon)) do
      :error -> {:error, "invalid codon"}
      {:ok, _} = value -> value
    end
  end
end
