defmodule RotationalCipher do
  @doc """
  Most of the code came from https://stackoverflow.com/questions/46386066/convert-list-of-codepoints-or-binary-to-string.
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    #take the input and convert to graphmeme list.  Then do math on each value, but ensure it loops around.
    text |> to_charlist |> Enum.map( &add( &1, shift ) ) |> List.to_string
  end

  defp add(ch, n) when ch in ?a..?z do
    rem((ch - ?a + n), 26) + ?a
  end
  defp add(ch, n) when ch in ?A..?Z do
    rem(ch - ?A + n, 26) + ?A
  end
  defp add(ch, _), do: ch
end
