import 'package:flutter/material.dart';
import 'package:immerverse_weather_forecast/controller/weather_controller.dart';
import 'package:immerverse_weather_forecast/ui/home_page.dart';
import 'package:provider/provider.dart';

import 'theme/app_color.dart';
import 'theme/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WeatherController()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});


  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Weather Forecast App',
      theme: ThemeData.light().copyWith(
        cardTheme: const CardTheme(color: AppColors.yellowLight),
        appBarTheme: const AppBarTheme(
          color: AppColors.yellowDark2,
          titleTextStyle: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w400,
            fontSize: 24,
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        cardTheme: CardTheme(
          color: AppColors.purpleAccentColor.withOpacity(0.2),
        ),
        appBarTheme: AppBarTheme(
          color: AppColors.purpleAccentColor.withOpacity(0.6),
          titleTextStyle: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w400,
            fontSize: 24,
          ),
        ),
      ),

      themeMode: themeProvider.currentThemeMode,
      home: const WeatherHomePage(),
    );
  }
}

