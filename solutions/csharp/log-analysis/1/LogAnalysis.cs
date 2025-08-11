using System;

public static class LogAnalysis 
{
    public static string SubstringAfter( this string input, string delim="" ){
        return input.Split(delim)[1];
    }
    public static string SubstringBetween( this string input, string delim1="", string delim2="" ){
        return input.Split(delim1)[1].Split(delim2)[0];
    }
    public static string Message( this string log ) => log.SubstringAfter(": ");
    
    public static string LogLevel( this string log ) => log.SubstringBetween("[","]");
}