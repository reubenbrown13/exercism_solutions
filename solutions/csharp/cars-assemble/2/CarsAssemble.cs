using System;

static class AssemblyLine
{
    public static double ProductionRatePerHour(int speed)
    {
        var successRate = 1.00;
        if ( speed == 10 ) { successRate = .77; }
        else if ( speed == 9 ) { successRate = .8; }
        else if ( speed >= 5 ) { successRate = .9; }
        else if ( speed < 1 ) { successRate = 0; }
        return ( 221 * speed * successRate );
    }

    public static int WorkingItemsPerMinute(int speed)
    {
        return (int)( ProductionRatePerHour(speed)/60 );
    }
}
