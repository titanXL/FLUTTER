import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String API_KEY = '9539f7fc862d298620f90096660773de';
const OPEN_WEATHER_MAP_URL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationData() async {
    Location location = Location();

    await location.setCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$OPEN_WEATHER_MAP_URL?lat=${location.getCurrentLocation()['latitude']}&lon=${location.getCurrentLocation()['longitude']}&appid=$API_KEY&units=metric');
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$OPEN_WEATHER_MAP_URL?q=$cityName&appid=$API_KEY&units=metric');
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
