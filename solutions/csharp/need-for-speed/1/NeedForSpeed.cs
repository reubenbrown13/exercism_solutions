using System;

class RemoteControlCar
{
    // TODO: define the constructor for the 'RemoteControlCar' class
    private int _battery = 100; 
    private int _distance = 0;
    public int speed { get; }
    public int batteryDrain { get; }

    public RemoteControlCar( int carSpeed, int carBatteryDrain ) {
        speed = carSpeed;
        batteryDrain = carBatteryDrain;
    }

    public bool BatteryDrained() {
        return _battery <= 0;
    }

    public int DistanceDriven() {
        return _distance;
    }

    public int BatteryLevel() {
        return _battery;
    }

    public void Drive() {
        if ( !BatteryDrained() ) {
            _battery -= batteryDrain;
            _distance += speed;
        }
    }

    public static RemoteControlCar Nitro() {
        return new RemoteControlCar( 50, 4 );
    }
}

class RaceTrack {
    // TODO: define the constructor for the 'RaceTrack' class
    int _distance = 800;

    public RaceTrack( int distance ) { 
        _distance = distance;
    }

    public bool CarCanFinish(RemoteControlCar car) {
        return ( Math.Ceiling((decimal)_distance/(decimal)car.speed)*car.batteryDrain <= car.BatteryLevel() );
    }
}
