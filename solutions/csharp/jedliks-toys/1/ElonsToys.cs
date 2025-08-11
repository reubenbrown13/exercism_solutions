using System;

class RemoteControlCar
{
    float battery = 100.0f; 
    int distance = 0;

    public static RemoteControlCar Buy() {
        return new RemoteControlCar();
    }

    public string DistanceDisplay() {
        return $"Driven {distance} meters";
    }

    public string BatteryDisplay() {
        if ( battery == 0 ) {
            return "Battery empty";
        } else { 
            return $"Battery at {battery}%"; }
    }

    public void Drive() {
        if ( battery > 0 ){
            battery -= 1;
            distance += 20;
        }
    }
}
