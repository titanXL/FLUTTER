import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> setCurrentLocation() async{
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      print(position);
      this.latitude = position.latitude;
      this.longitude = position.longitude;

    }
    catch (e) {
      print(e);
      this.latitude = 33.0;
      this.longitude = -122.0;
    }
  }

  Map<String, double> getCurrentLocation()  {
    return {
      'latitude': this.latitude,
      'longitude': this.longitude
    };
  }
}







