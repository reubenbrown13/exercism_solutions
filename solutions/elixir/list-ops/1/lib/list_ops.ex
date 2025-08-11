defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count([]) do 0 end
  def count([_head,tail]) do
    1 + count(tail)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reduce(l, [], &([&1 | &2]))
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    reduce(l, [], &([f.(&1) | &2]))
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    reduce(l, [], fn(head, acc) -> if ( f.(head) ), do: [head|acc], else: acc end)
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([],acc,_f) do acc end
  def reduce([head|tail], acc, f) do
    reduce(tail, f.(head,acc), f)
  end

  @spec append(list, list) :: list
  def append(a, b) do
    reverse(a) |> reduce(b, &([&1 | &2]))
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    reverse(ll) |> reduce([], &append(&1, &2))
  end
end
