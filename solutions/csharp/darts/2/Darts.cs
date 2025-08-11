using System;

public static class Darts
{
    public static int Score(double x, double y)
    {
       return Math.Sqrt( x*x + y*y ) switch {
           var strikePt when (strikePt <= 1) => 10,
           var strikePt when (strikePt <= 5) => 5,
           var strikePt when (strikePt <= 10) => 1,
           _ => 0,
       };
    }
}
