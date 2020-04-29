
import 'package:climaapp/services/location.dart';
import 'package:climaapp/services/networking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
const api_key='8cb6386fe572b5b0befe4eba9bfa7c2f';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$api_key&units=metric');

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

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location
            .longitude}&appid=$api_key&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}



