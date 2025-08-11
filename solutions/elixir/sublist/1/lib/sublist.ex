defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  @spec compare(list,list) :: atom
  def compare(a,b) when a == b do :equal end
  def compare([],_b) do :sublist end
  def compare(_a,[]) do :superlist end
  def compare(a, b) when length(a) == length(b) and a != b do :unequal end
  def compare(a, b) when length(a) != length(b) do
    cond do
      List.starts_with?(b, a) or List.starts_with?(tl(b), a) -> :sublist
      List.starts_with?(a, b) or List.starts_with?(tl(a), b) -> :superlist
      length(a) < length(b) -> compare(a,tl(b))
      length(a) > length(b) -> compare(tl(a),b)
      true -> :unequal
    end
  end
  #def compare(a, b) when a != b do :unequal end
end
