import 'package:geolocator/geolocator.dart';

class Location {
  double _longitute = 0.0;
  double _latitude = 0.0;
  String errormsg = '';

  double get longitute => _longitute;
  double get latitude => _latitude;


  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      _longitute = position.longitude;
      _latitude = position.latitude;

      print(position);
    } catch (e) {
      errormsg = e.toString();
      _longitute = 0.0;
      _latitude = 0.0;
      print(e);
    }

  }

  Location() {
    getCurrentLocation();
  }
}