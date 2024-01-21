import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:immerverse_weather_forecast/data/cities_data.dart';
import 'package:immerverse_weather_forecast/data/weather_forecast_data.dart';


class WeatherApiService {
  final String apiKey = '2091953ce6ab36724ab3ff0c928fb2d0';

  Future<List<WeatherForecastModal>> fetchWeather(List<String> cities) async {
    final List<WeatherForecastModal> weatherData = [];

    for (String city in cities) {
      var response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=$apiKey'));
      if (response.statusCode == 200) {
        weatherData.add(WeatherForecastModal.fromJson(json.decode(response.body)));
      } else {
        throw Exception('Failed to load cities');
      }
    }
    return weatherData;
  }

   Future<CitiesData> fetchCities() async {
    final response = await http.get(Uri.parse('https://a944ede2-133d-45fa-82e1-0fb951492eda.mock.pstmn.io/cities'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return CitiesData.fromJson(data);
    } else {
      throw Exception('Failed to load cities');
    }
  }
}


