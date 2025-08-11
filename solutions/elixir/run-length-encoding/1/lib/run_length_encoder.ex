defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @encode_re ~r/(\p{L}|\W)\1*/u
  @decode_re  ~r/(\d+\p{L})|((\p{L})\1?(?!\1))/u
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    Regex.replace(@encode_re, string, fn(consecutive, char) ->
      do_compress_string(String.length(consecutive),char)
    end)
  end

  @spec do_compress_string(Integer.n(),String.t()) :: String.t()
  defp do_compress_string(n,c) when n == 1 do
    c
  end

  @spec do_compress_string(Integer.n(),String.t()) :: String.t()
  defp do_compress_string(n,c) do
    Integer.to_string(n) <> c
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) when byte_size(string) <= 1 do
    string
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    testChar = Integer.parse(binary_part(string,0,1))
    case testChar do
      :error -> String.first(string) <> decode(String.replace_leading(string, String.first(string), ""))
      {_number, _} ->  String.split( string, @decode_re, include_captures: true, trim: true )
          |> Enum.map( fn(x) -> String.split( x , ~r/\d+/u, include_captures: true, trim: true ) |> do_append_string() end)
          |> Enum.join()
    end
  end

  @spec do_append_string(list(String.t())) :: String.t()
  def do_append_string(let) when length(let) == 1  do
    hd(let)
  end
  @spec do_append_string(list(String.t())) :: String.t()
  def do_append_string([count,let]) when count == "1" do
    let
  end
  @spec do_append_string(list(String.t())) :: String.t()
  def do_append_string([count,let]) do
    String.duplicate( let, String.to_integer(count) )
  end
end
