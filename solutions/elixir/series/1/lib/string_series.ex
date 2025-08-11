defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    if size > String.length(s) || size < 1, do: [],
    else: [String.slice(s,0,size)] ++ slices(Enum.at(Tuple.to_list(String.split_at(s,1)),1), size)
  end
end
