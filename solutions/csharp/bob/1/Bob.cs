using System;

public static class Bob
{
    public static string Response(string statement) => statement.Trim() switch 
    {
        var stm when stm.ToUpper() == stm && stm.ToLower() != stm && stm.EndsWith("?") => "Calm down, I know what I'm doing!",
        var stm when stm.Length == 0 => "Fine. Be that way!",
        var stm when stm.EndsWith("?") => "Sure.", 
        var stm when stm.ToUpper() == stm && stm.ToLower() != stm => "Whoa, chill out!",
        _ => "Whatever.",
    };
}