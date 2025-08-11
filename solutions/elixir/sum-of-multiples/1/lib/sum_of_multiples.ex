defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    Enum.reduce( factors, [], fn (x,acc) -> [acc| SumOfMultiples.fact(limit,x)] end )
    |> List.flatten |> Enum.uniq |> Enum.sum
  end

  @spec fact(non_neg_integer,non_neg_integer) :: [non_neg_integer]
  def fact(limit,factor) do
    Enum.map((1..limit-1), fn x -> if (rem(x,factor) == 0) do x end end)
    |> Enum.sort() |> Enum.take_while( fn x -> x != nil end)
  end
end
