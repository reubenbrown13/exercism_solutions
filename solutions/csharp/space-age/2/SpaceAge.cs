using System;

public class SpaceAge
{
    const long yearInSecs = 31557600;
    public int Seconds { get; private set; }
    public SpaceAge(int seconds) { Seconds = seconds; }

    public double OnEarth() => (Seconds/(1.0*yearInSecs));

    public double OnMercury() => (Seconds/(0.2408467*yearInSecs));

    public double OnVenus() => (Seconds/(0.61519726*yearInSecs));

    public double OnMars() => (Seconds/(1.8808158*yearInSecs));

    public double OnJupiter() => (Seconds/(11.862615*yearInSecs));

    public double OnSaturn() => (Seconds/(29.447498*yearInSecs));

    public double OnUranus() => (Seconds/(84.016846*yearInSecs));

    public double OnNeptune() => (Seconds/(164.79132*yearInSecs)); 
}