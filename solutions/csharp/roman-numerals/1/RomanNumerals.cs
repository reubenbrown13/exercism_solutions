using System;
using System.Collections.Generic;

public static class RomanNumeralExtension
{
    public static string ToRoman(this int value)
    {
        Dictionary<int, string> romanNumbers = new Dictionary<int, string>() { {1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"}, {100, "C"}, {90, "XC"}, {50, "L"}, {40, "XL"}, {10, "X"}, {9, "IX"}, {5, "V"}, {4, "IV"}, {1, "I"} };
        System.Text.StringBuilder romanString = new System.Text.StringBuilder("");
        foreach( KeyValuePair<int,string> romanLet in romanNumbers ) {
            if ( value >= romanLet.Key ) { 
                romanString.Insert( romanString.ToString().Length, romanLet.Value, ((value/romanLet.Key)) );
                value = value - romanLet.Key*((value/romanLet.Key));
            } 
            if ( value <= 0 ) { break; }
        }
        return romanString.ToString();
    }
}