import 'package:flutter/material.dart';
import 'package:immerverse_weather_forecast/data/weather_forecast_data.dart';

class WeatherCard extends StatelessWidget {
  final WeatherForecastModal weatherData;
  final IconData Function(String) getWeatherIconFromCode;
  final double Function(double) temperatureToCelsius;

  const WeatherCard({
    required this.weatherData,
    required this.getWeatherIconFromCode,
    required this.temperatureToCelsius,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 16, 16, 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${weatherData.name}, ${weatherData.sys.country}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${temperatureToCelsius(weatherData.main.temp).toStringAsFixed(2)}°C',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                Icon(
                  getWeatherIconFromCode(
                      weatherData.weather[0].icon),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              weatherData.weather[0].description,
              style: const TextStyle(fontWeight: FontWeight.w600,
              fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Humidity'),
                const Spacer(),
                Text('${weatherData.main.humidity}%',
                  style: const TextStyle(fontWeight: FontWeight.w600,),),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Text('Low',),
                const Spacer(),
                Text(
                  '${temperatureToCelsius(weatherData.main.tempMin).toStringAsFixed(2)}°C',
                  style: const TextStyle(fontWeight: FontWeight.w600,),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Text('High'),
                const Spacer(),
                Text(
                  '${temperatureToCelsius(weatherData.main.tempMax).toStringAsFixed(2)}°C',
                  style: const TextStyle(fontWeight: FontWeight.w600,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
