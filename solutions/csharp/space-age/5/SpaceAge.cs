using System;

public class SpaceAge
{
    readonly long YearInSecs = 31557600;
    public int Seconds { get; private set; }
    public SpaceAge(int seconds) { Seconds = seconds; }

    public double OnEarth() => CalcYear(Seconds);

    public double OnMercury() => CalcYear(Seconds, 0.2408467);

    public double OnVenus() => CalcYear(Seconds, 0.61519726);

    public double OnMars() => CalcYear(Seconds, 1.8808158);

    public double OnJupiter() => CalcYear(Seconds, 11.862615);

    public double OnSaturn() => CalcYear(Seconds, 29.447498);

    public double OnUranus() => CalcYear(Seconds, 84.016846);

    public double OnNeptune() => CalcYear(Seconds, 164.79132);

    private double CalcYear( int Seconds = 0, double OrbitalRatio = 1.0)
    {
        return (Seconds / (OrbitalRatio * YearInSecs));
    }
}