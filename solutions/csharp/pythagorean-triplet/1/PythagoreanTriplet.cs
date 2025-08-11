using System;
using System.Collections.Generic;

public static class PythagoreanTriplet
{
    public static IEnumerable<(int a, int b, int c)> TripletsWithSum(int sum)
    {
        List<(int, int, int)> result = new List<(int a, int b, int c)>();
        int b, c;
        for ( var a=3; a<=((sum/3)-1); a++ ) {
            if ( (int)(a*(long)sum%(a-sum)) == 0 ) {
                b = (int)((long)sum*(2*a-sum) /(2*a -2*(long)sum));
                c = sum-a-b;
                if ( ( a*a + b*b ) == c*c && a < b && b < c ) {
                    result.Add( (a, b, c) );
                }
            }
        }
        return result.ToArray();
    }
}
