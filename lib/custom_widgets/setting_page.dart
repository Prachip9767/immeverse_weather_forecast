import 'package:flutter/material.dart';
import 'package:immerverse_weather_forecast/theme/app_color.dart';
import 'package:immerverse_weather_forecast/theme/theme.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Settings'),
      ),
      body: SwitchListTile(
        activeColor:AppColors.purpleAccentColor,
        title: const Text('Dark Mode',
        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
        value: themeProvider.isDarkMode,
        onChanged: (bool value) {
          themeProvider.toggleTheme();
        },
      ),
    );
  }
}