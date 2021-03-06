import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';

var appid = 'af5984c7f165ae1e44abbdeaafb41c43';

class WeatherModel {
  Future<dynamic> getcity(String city) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$appid';
    NetworkHelp networkHelp = NetworkHelp(url);
    var weatherdata = await networkHelp.getData();
    return weatherdata;
  }

  Future<dynamic> getLocation() async {
    Location location = Location();
    await location.getLocation();

    NetworkHelp networkhelper = NetworkHelp(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.lattitude}&lon=${location.longitude}&appid=$appid');
    var weatherdata = await networkhelper.getData();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return 'โ๏ธ';
    } else if (condition == 800) {
      return '๐ค๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
