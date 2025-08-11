defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) when list == [] or list == [nil] do [] end
  def flatten(list) when length(list) <= 1 do List.flatten(list) end
  def flatten(list) do
    [head|tail] = List.flatten(list)
    if (!is_nil(head) and !is_nil([head])), do: [head|flatten(tail)], else: flatten(tail)
  end
end
