import 'package:flutter/material.dart';
import 'package:immerverse_weather_forecast/data/cities_data.dart';
import 'package:immerverse_weather_forecast/data/weather_forecast_data.dart';
import 'package:immerverse_weather_forecast/network/api_service.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:intl/intl.dart';


class WeatherController with ChangeNotifier {
  final List<WeatherForecastModal> _weatherData = [];
  late CitiesData cities;
  final WeatherApiService _weatherAPI = WeatherApiService();
  late bool isLoading;

  List<WeatherForecastModal> get weatherData => _weatherData;

  Future<void> fetchWeather() async {
    isLoading = true;
    try {
      cities = await _weatherAPI.fetchCities();
      final newWeatherData = await _weatherAPI.fetchWeather(
        cities.cities,
      );
      _weatherData.addAll(newWeatherData);
    } catch (e) {
     print(e.toString()) ;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  IconData getWeatherIconFromCode(String iconCode) {
    switch (iconCode) {
      case "01d":
        return WeatherIcons.day_sunny;
      case "01n":
        return WeatherIcons.night_clear;
      case "02d":
        return WeatherIcons.day_cloudy;
      case "02n":
        return WeatherIcons.night_cloudy;
      case "03d":
      case "03n":
        return WeatherIcons.cloud;
      case "04d":
      case "04n":
        return WeatherIcons.cloudy;
      case "09d":
      case "09n":
        return WeatherIcons.rain;
      case "10d":
      case "10n":
        return WeatherIcons.showers;
      case "11d":
      case "11n":
        return WeatherIcons.thunderstorm;
      case "13d":
      case "13n":
        return WeatherIcons.snow;
      case "50d":
      case "50n":
        return WeatherIcons.fog;
      default:
        return WeatherIcons.na;
    }
  }

  double temperatureToCelsius(double tempData){
    double temp=tempData -273.15;
    return temp;
  }

  String convertUnixTimestampToIST(int timestamp) {
  final int millisecondsSinceEpoch = timestamp * 1000;
  final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  final DateTime istDateTime = dateTime.add(const Duration(hours: 5, minutes: 30));
  final DateFormat formatter = DateFormat('hh:mm a',);
  final String formattedIST = formatter.format(istDateTime);
  return formattedIST;
  }

}


