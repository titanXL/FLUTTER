import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> setCurrentLocation() async {
    try {
//      Position position = await Geolocator()
//          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      this.latitude = 42.6977;
      this.longitude = 23.3219;
    } catch (e) {
      print(e);
      this.latitude = 42.6977;
      this.longitude = 23.3219;
    }
  }

  Map<String, double> getCurrentLocation() {
    return {'latitude': this.latitude, 'longitude': this.longitude};
  }
}
