using System;

public static class Raindrops
{
    public static string Convert(int number)
    {
        var noise = "";
        if ( number % 3 == 0 ) { noise += "Pling"; }
        if ( number % 5 == 0 ) { noise += "Plang"; }
        if ( number % 7 == 0 ) { noise += "Plong"; }
        if ( noise.Length == 0 ) { noise = number.ToString(); }
        return noise;
    }
}