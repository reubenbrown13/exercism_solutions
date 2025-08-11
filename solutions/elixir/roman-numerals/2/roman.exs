defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @romanDict [[1000, 'M'],[900, 'CM'],[500, 'D'],[400, 'CD'],[100, 'C'],[90, 'XC'],[50, 'L'],[40, 'XL'],[10, 'X'],[9, 'IX'],[5, 'V'],[4, 'IV'],[1, 'I']]
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    do_numerals(number, [], @romanDict) |> to_string
  end

  defp do_numerals(number, roman_value, _) when number < 1 do
    roman_value
  end

  defp do_numerals(number, roman_value, [[decimal, roman] | _] = numerals)
    when number >= decimal do
    do_numerals(number - decimal, roman_value ++ roman, numerals)
  end

  defp do_numerals(number, roman_value, [_ | numerals]) do
    do_numerals(number, roman_value, numerals)
  end
end
