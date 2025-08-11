defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @vowelSounds ["a","e","i","o","u"]
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    String.split(phrase) |> Enum.map( fn(word) -> do_movechars(word) end ) |> Enum.join( " " )
  end
  defp do_movechars(word) do
    char = String.first(word)
     if "qu" == String.slice(word, 0..1) , do: do_translate(String.replace_leading(word, "qu", "") <> "qu"),
      else:
        if Enum.member?(@vowelSounds, char) || ( ( "x" == char || "y" == char ) && !Enum.member?(@vowelSounds, String.slice(word, 1..1)) ),
          do: do_translate(word),
        else: do_movechars( String.replace(word, char, "", global: false) <> char )
  end
  defp do_translate(word) do
    word <> "ay"
  end
end
