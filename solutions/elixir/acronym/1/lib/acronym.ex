defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.replace( ~r/[\\'_]/, "" )
    |> String.replace( ~r/\W/, " ")
    |> String.replace(~r/[a-z][A-Z]/, fn str -> String.first(str)<>" "<>String.last(str) end)
    |> String.upcase |> String.split
    |> Enum.map( fn(word) -> String.first(word) end)
    |> Enum.join()
  end
end
