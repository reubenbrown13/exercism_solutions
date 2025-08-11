using System;

static class LogLine
{
    public static string Message(string logLine)
    {
        return logLine.Split(':', StringSplitOptions.TrimEntries)[1];
    }

    public static string LogLevel(string logLine)
    {
        return logLine.Split(':', StringSplitOptions.TrimEntries)[0].ToString().Replace('[',' ').Replace(']',' ').ToLower().Trim();
    }

    public static string Reformat(string logLine)
    {
        return Message(logLine) + " (" + LogLevel(logLine) + ")";
    }
}
