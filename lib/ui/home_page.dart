import 'package:flutter/material.dart';
import 'package:immerverse_weather_forecast/controller/weather_controller.dart';
import 'package:immerverse_weather_forecast/custom_widgets/setting_page.dart';
import 'package:immerverse_weather_forecast/custom_widgets/weather_card_item.dart';
import 'package:immerverse_weather_forecast/theme/app_color.dart';
import 'package:provider/provider.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({Key? key}) : super(key: key);

  @override
  WeatherHomePageState createState() => WeatherHomePageState();
}

class WeatherHomePageState extends State<WeatherHomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<WeatherController>(context, listen: false).fetchWeather();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Weather Forecast'),
        elevation: 4,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: AppColors.black.withOpacity(0.6)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Consumer<WeatherController>(
        builder: (context, weatherProvider, child) {
          if (weatherProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return
          weatherProvider.weatherData.isEmpty?
              const Center(child: Text('No Data Found')):GridView.builder(
              padding: const EdgeInsets.all(14),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
              itemCount: weatherProvider.weatherData.length,
              itemBuilder: (context, index) {
                return WeatherCard(
                  weatherData: weatherProvider.weatherData[index],
                  getWeatherIconFromCode:
                  weatherProvider.getWeatherIconFromCode,
                  temperatureToCelsius:
                  weatherProvider.temperatureToCelsius,
                );
              },
            );
          }
        },
      ),
    );
  }
}


