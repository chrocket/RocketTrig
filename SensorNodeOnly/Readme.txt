Sensor Node only board

Supports a variety of sensors

Used with jlcpcb pc board fab

This is not stand-alone;  must be used in concert with at least on RocketTrig Node.

Edit Camera_reomote_txrx_sensorNodeOnly.ino
- Select one sensor type only (Sensor_x) and re-compile
- Set behvior of overrideAlwaysArmed
      True - a sensor hit will always trigger camear
      False - a sensor hit will only trigger camera if "armed" is true (use this for sensors with lots of false positives, but you must arm before you are ready to take a picture)