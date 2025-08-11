defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    Enum.map([3,5,7], fn(x) ->
      cond do
        rem(number,x) == 0 -> (
        cond do
          x == 3 -> "Pling"
          x == 5 -> "Plang"
          x == 7 -> "Plong"
        end )
        true -> ""
      end
    end) |> Enum.join()
    |> (&( if (String.length(&1) ==0), do: Integer.to_string(number), else: &1 )).()
  end
end
