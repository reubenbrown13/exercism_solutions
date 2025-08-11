defmodule SecretHandshake do
  @handshakeDict %{0 => "jump", 1 => "close your eyes", 2 => "double blink", 3 => "wink"}
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    opp = code
    |> Integer.mod( 32 )
    |> Integer.to_string(2)
    |> String.pad_leading(5, "0")
    |> String.split("", trim: true) |> List.delete_at(0)
    |> Enum.with_index() # create an index to use to work against the @handshakeDict
    if(code < 16, do: Enum.reverse(opp), else: opp ) # reverse the order so I can loop over each value and get the steps
    |> Enum.map( fn {val, x} -> if val == "1", do: Map.fetch!(@handshakeDict, x) end) # map the new values
    |> Enum.filter( & !is_nil(&1)) |> Enum.to_list()
  end
end
